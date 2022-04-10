# frozen_string_literal: true

class LogsOrderer
  def initialize(logs, orderer)
    @logs = logs
    @orderer = orderer
  end

  def sort
    @orderer.sort(@logs)
  end
end
