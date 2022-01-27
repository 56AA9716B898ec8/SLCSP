require 'slcsp'

describe SLCSP do
  let(:instance) { described_class.new }
  let(:expected_output) do
    File.read(File.expand_path('../spec/support/expected_output.csv', __dir__))
  end

  describe '#solve' do
    it 'prints the solution to STDOUT' do
      expect { instance.solve }.to output(expected_output).to_stdout
    end
  end

  describe '#slcsp' do
    subject { instance.slcsp(zipcode) }

    context 'with a valid zipcode' do
      let(:zipcode) { '64148' }

      it 'returns the slcsp for the given zipcode' do
        is_expected.to eq('245.20')
      end
    end

    context 'with an invalid zipcode' do
      let(:zipcode) { '00000000' }

      it 'returns nil' do
        is_expected.to eq(nil)
      end
    end
  end
end
