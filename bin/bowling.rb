#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/bowling/game'

puts Bowling::Game.new(ARGV[0]).calc_score
