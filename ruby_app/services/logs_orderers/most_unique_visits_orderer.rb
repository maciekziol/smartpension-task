# frozen_string_literal: true

class MostUniqueVisitsOrderer < BaseOrderer
  def sort(logs)
    logs.sort_by { |_url, ips| -ips.uniq.size }.to_h
  end
end
