require 'slcsp/rate_area_for_zip_code'

describe SLCSP::RateAreaForZipcode do
  let(:instance) { described_class.new }

  describe '#call' do
    subject { instance.call(zipcode) }

    context 'with a valid zipcode' do
      let(:zipcode) { '18229' }
      let(:rate_area) { %w[PA 3] }

      it 'returns a rate_area' do
        is_expected.to eq(rate_area)
      end
    end

    context 'with an invalid zipcode' do
      let(:zipcode) { 'whatever' }

      it 'returns nil' do
        is_expected.to eq(nil)
      end
    end
  end
end
