require 'slcsp/slcsp_for_rate_area'

describe SLCSP::SlcspForRateArea do
  let(:instance) { described_class.new }

  describe '#call' do
    subject { instance.call(rate_area) }

    context 'with a valid rate_area' do
      let(:rate_area) { %w[PA 3] }
      let(:slcsp) { '231.48' }

      it 'returns a SLCSP' do
        is_expected.to eq(slcsp)
      end
    end

    context 'with an invalid rate_area' do
      let(:rate_area) { 'bad' }

      it 'returns nil' do
        is_expected.to eq(nil)
      end
    end
  end
end
