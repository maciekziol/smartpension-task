# !/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../parser'

describe 'parser file' do
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
      "webpages with most page views:\n /about/2 90 visits\n /contact 89 visits\n /index 82 visits\n /about 81 visits"\
      "\n /help_page/1 80 visits\n /home 78 visits\nlist of webpages with most unique page views:\n /help_page/1 23 "\
      "unique views\n /contact 23 unique views\n /home 23 unique views\n /index 23 unique views\n /about/2 22 unique "\
      "views\n /about 21 unique views\n"
    end

    it 'prints formatted result to STDOUT' do
      expect { process(args) }.to output(expected_result).to_stdout
    end
  end
end
