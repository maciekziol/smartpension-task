# frozen_string_literal: true

require_relative '../../presenters/logs_presenter'

describe LogsPresenter do
  subject(:presenter) { described_class.new(ordered_logs, kind) }

  let(:kind) { :visits }
  let(:ordered_logs) do
    {
      '/about/2' => ['444.701.448.104', '444.701.448.104', '836.973.694.403', '184.123.665.067'],
      '/contact' => ['184.123.665.067', '184.123.665.067', '543.910.244.929']
    }
  end

  describe '#tally_with_title' do
    context 'when kind is :visits' do
      let(:expected_result) { "webpages with most page views:\n /about/2 4 visits\n /contact 3 visits\n" }

      it 'returns proper string' do
        expect(presenter.tally_with_title).to eq(expected_result)
      end
    end

    context 'when kind is :uniqe_views' do
      let(:kind) { :uniqe_views }
      let(:expected_result) do
        "list of webpages with most unique page views:\n /about/2 3 unique views\n /contact 2 unique views\n"
      end

      it 'returns proper string' do
        expect(presenter.tally_with_title).to eq(expected_result)
      end
    end
  end
end
