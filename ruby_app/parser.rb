#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

Dir['./services/**/*.rb'].sort.each { |file| require file }
Dir['./presenters/**/*.rb'].sort.each { |file| require file }

IncorrectFilenameArgumentError = Class.new(ArgumentError)

def verify_arguments(args)
  raise ArgumentError.new, "wrong number of arguments (given #{args.size}, expected 1)" if args.size != 1
  return if args[0].end_with?('.log')

  raise IncorrectFilenameArgumentError.new, "wrong filename provided (given '#{args[0]}', expected '*.log')"
end

def read_and_parse_logs(args)
  File.read(args[0]).split(/\n/).each_with_object({}) do |log_entry, memo|
    url, ip = log_entry.split(' ')
    memo.key?(url) ? memo[url] << ip : memo[url] = [ip]
    memo
  end
end

def process(args)
  verify_arguments(args)

  formatted_logs = read_and_parse_logs(args)
  sorted_by_most_views = LogsOrderer.new(formatted_logs, MostPageViewsOrderer.new).sort
  sorted_by_uniq_views = LogsOrderer.new(formatted_logs, MostUniqueVisitsOrderer.new).sort

  puts(LogsPresenter.new(sorted_by_most_views, :visits).tally_with_title +
       LogsPresenter.new(sorted_by_uniq_views, :uniqe_views).tally_with_title)
end

process(ARGV) if $PROGRAM_NAME == __FILE__
