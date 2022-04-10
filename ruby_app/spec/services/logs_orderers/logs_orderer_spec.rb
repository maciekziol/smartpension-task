# frozen_string_literal: true

Dir['./services/**/*.rb'].sort.each { |file| require file }

describe LogsOrderer do
  subject(:log_orderer) { described_class.new(formatted_logs, orderer) }

  describe '#sort' do
    let(:formatted_logs) do
      {
        '/help_page/1' => ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408'],
        '/contact' => ['184.123.665.067', '184.123.665.067', '543.910.244.929', '929.398.951.889', '929.398.951.889'],
        '/about/2' => ['444.701.448.104', '836.973.694.403', '184.123.665.067', '382.335.626.855'],
        '/home' => ['184.123.665.067', '235.313.352.950', '316.433.849.805']
      }
    end

    context 'when orderer is MostPageViewsOrderer' do
      let(:orderer) { MostPageViewsOrderer.new }
      let(:sorted_array) do
        {
          '/contact' => ['184.123.665.067', '184.123.665.067', '543.910.244.929', '929.398.951.889', '929.398.951.889'],
          '/help_page/1' => ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408'],
          '/about/2' => ['444.701.448.104', '836.973.694.403', '184.123.665.067', '382.335.626.855'],
          '/home' => ['184.123.665.067', '235.313.352.950', '316.433.849.805']
        }
      end

      it 'returns sorted hash' do
        expect(log_orderer.sort).to eq(sorted_array)
      end
    end

    context 'when orderer is MostUniqueVisitsOrderer' do
      let(:orderer) { MostUniqueVisitsOrderer.new }
      let(:sorted_array) do
        {
          '/help_page/1' => ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408'],
          '/about/2' => ['444.701.448.104', '836.973.694.403', '184.123.665.067', '382.335.626.855'],
          '/contact' => ['184.123.665.067', '184.123.665.067', '543.910.244.929', '929.398.951.889', '929.398.951.889'],
          '/home' => ['184.123.665.067', '235.313.352.950', '316.433.849.805']
        }
      end

      it 'returns sorted hash' do
        expect(log_orderer.sort).to eq(sorted_array)
      end
    end
  end
end
