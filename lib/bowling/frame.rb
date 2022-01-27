# frozen_string_literal: true

module Bowling
  # 各フレームを表現するクラス
  class Frame
    attr_reader :first_score, :second_score, :third_score
    attr_accessor :bonus_score

    def initialize(first_score, second_score, third_score, final: false)
      @first_score = first_score
      @second_score = second_score
      @third_score = third_score.to_i
      @bonus_score = 0
      @final = final
    end

    def total_score
      @first_score + @second_score + @third_score + @bonus_score
    end

    def spare?
      return false if final_frame?

      @first_score + @second_score == 10
    end

    def strike?
      return false if final_frame?

      @first_score == 10
    end

    def final_frame?
      @final
    end
  end
end
