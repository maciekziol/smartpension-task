# !/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../parser'

describe 'parser' do
  let(:args) { [] }

  context 'when no argument provided' do
    it 'raises ArgumentError' do
      expect { process(args) }.to raise_error(ArgumentError)
    end
  end

  context 'when invalid argument provided' do
    let(:args) { ['webserver.lo'] }

    it 'raises IncorrectFilenameArgumentError' do
      expect { process(args) }.to raise_error(IncorrectFilenameArgumentError)
    end
  end

  context 'when valid logfile name provided as argument ' do
    let(:args) { ['webserver.log'] }
    let(:expected_result) do
      "webpages with most page views: /home 90 visits /index 80 visits \n"\
      "list of webpages with most unique page views:\n /about/2 8 unique views \n /index 5 unique views\n"
    end

    it 'prints formatted result ArgumentError' do
      expect { process(args) }.to output(expected_result).to_stdout
    end
  end
end
