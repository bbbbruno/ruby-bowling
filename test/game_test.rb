# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/game'

class GameTest < Minitest::Test
  def setup
    @tests = [
      { in: '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5', want: 139 },
      { in: '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X', want: 164 },
      { in: '0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4', want: 107 },
      { in: '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0', want: 134 },
      { in: '6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,1,8', want: 144 },
      { in: 'X,X,X,X,X,X,X,X,X,X,X,X', want: 300 }
    ]
  end

  def test_bowling_scores
    @tests.each do |test|
      game = Game.new(test[:in])
      assert_equal test[:want], game.score
    end
  end
end
