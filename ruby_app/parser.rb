#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

IncorrectFilenameArgumentError = Class.new(ArgumentError)

def process(args)
  raise ArgumentError.new, "wrong number of arguments (given #{args.size}, expected 1)" if args.size != 1
  unless args[0].end_with?('.log')
    raise IncorrectFilenameArgumentError.new, "wrong filename provided (given '#{args[0]}', expected '*.log')"
  end
end

process(ARGV) if $PROGRAM_NAME == __FILE__
