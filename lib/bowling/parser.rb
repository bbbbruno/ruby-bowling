# frozen_string_literal: true

module Bowling
  # 入力を解析して各フレームごとのスコア配列に変換する
  class Parser
    def initialize(input, final_frame_count)
      @input = input
      @final_frame_count = final_frame_count
      @scores = []
    end

    def parse
      translate_x
      slice_each
      @scores
    end

    private

    def translate_x
      @scores = @input.split(',').map.with_object([]) do |i, result|
        if i == 'X'
          result << 10
          result << 0 unless result.size > (@final_frame_count - 1) * 2
        else
          result << i.to_i
        end
      end
    end

    def slice_each
      @scores = @scores.each_slice(2).map { |f, s| [f, s] }
      return if @scores[@final_frame_count].nil?  

      @scores[@final_frame_count - 1][2] = @scores[@final_frame_count][0]
      @scores.delete_at(@final_frame_count)
    end
  end
end
