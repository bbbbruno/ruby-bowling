# frozen_string_literal: true

require_relative './frame_factory'
require_relative './parser'

module Bowling
  # １ゲームの合計スコアを計算する
  class Game
    attr_reader :total_score

    FINAL_FRAME_COUNT = 10

    def initialize(input)
      @parser = Bowling::Parser.new(input, FINAL_FRAME_COUNT)
      @frame_factory = Bowling::FrameFactory.new(FINAL_FRAME_COUNT)
      @total_score = 0
    end

    def calc_score
      frames.sum(&:total_score)
    end

    private

    def frames
      @frames ||= @frame_factory.create_frames(scores)
    end

    def scores
      @scores ||= @parser.parse
    end
  end
end
