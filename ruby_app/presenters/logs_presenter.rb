# frozen_string_literal: true

class LogsPresenter
  PRESENTATION_ATTRIBUTES = {
    visits: { title: "webpages with most page views:\n", activity: 'visits' },
    uniqe_views: { title: "list of webpages with most unique page views:\n", activity: 'unique views' }
  }.freeze

  def initialize(ordered_logs, kind)
    @ordered_logs = ordered_logs
    @kind = kind
  end

  def tally_with_title
    PRESENTATION_ATTRIBUTES[@kind][:title] + formatted_entries
  end

  private

  def formatted_entries
    @ordered_logs.each_key.inject('') { |memo, url| memo + formatted_entry(url) }
  end

  def formatted_entry(url)
    " #{url} #{count_occurences(url)} #{PRESENTATION_ATTRIBUTES[@kind][:activity]}\n"
  end

  def count_occurences(url)
    case @kind
    when :visits
      @ordered_logs[url].size
    when :uniqe_views
      @ordered_logs[url].uniq.size
    end
  end
end
