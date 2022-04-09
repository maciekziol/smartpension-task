#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'

raise ArgumentError, 'wrong number of arguments (given 0, expected 1) (ArgumentError)' if ARGV.empty?

binding.pry
puts 'elo'
