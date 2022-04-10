# frozen_string_literal: true

class MostPageViewsOrderer < BaseOrderer
  def sort(logs)
    logs.sort_by { |_url, ips| -ips.size }.to_h
  end
end
