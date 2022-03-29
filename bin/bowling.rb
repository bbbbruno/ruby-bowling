#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/game'

def main
  game = Game.new(ARGV[0])
  puts game.score
end

main
