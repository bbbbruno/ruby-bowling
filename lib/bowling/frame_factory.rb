# frozen_string_literal: true

require_relative './frame'

module Bowling
  # Frameの配列を作成するクラス
  class FrameFactory
    def initialize(final_frame_count)
      @final_frame_count = final_frame_count
      @scores = []
      @frames = []
    end

    def create_frames(scores)
      @scores = scores
      @frames = []
      build_frames_with_no_bonus
      add_bonus_to_frames
      @frames
    end

    private

    def build_frames_with_no_bonus
      @frames = @scores.map.with_index do |score, index|
        is_final = index == @final_frame_count - 1
        Frame.new(score[0], score[1], score[2], final: is_final)
      end
    end

    def add_bonus_to_frames
      @frames.each.with_index do |frame, index|
        break if index == @frames.size - 1

        next_frame = @frames[index + 1]
        next_next_frame = @frames[index + 2]
        next unless frame.strike? || frame.spare?

        frame.bonus_score = calc_bonus(frame, next_frame, next_next_frame)
      end
    end

    def calc_bonus(frame, next_frame, next_next_frame)
      if frame.strike?
        if next_frame.strike? && !next_frame.final_frame?
          next_frame.first_score + next_next_frame.first_score
        else
          next_frame.first_score + next_frame.second_score
        end
      elsif frame.spare?
        next_frame.first_score
      end
    end
  end
end
