require './lib/parser'

describe Parser do
  let(:parser) { Parser.new }
  describe '#valid?' do
    context 'when validating the user input' do
      it 'returns false' do
        expect(parser.valid?('000')).to eq(false)
      end

      it 'returns false' do
        expect(parser.valid?('3 0')).to eq(false)
      end

      it 'returns true' do
        expect(parser.valid?('0 0')).to eq(true)
      end
    end
  end

  describe '#read' do
    context 'when reading the input' do
      it 'returns the row' do
        parser.read('0 0')
        expect(parser.read_row).to eq(0)
      end

      it 'returns the column' do
        parser.read('0 0')
        expect(parser.read_column).to eq(0)
      end

      it 'outputs invalid input please type suitable input' do
        expect { parser.read('2 c') }.to output("Invalid input please try again or type help for info\n").to_stdout
      end
    end
  end
end
