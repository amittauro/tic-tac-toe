# frozen_string_literal: true

require './lib/display'

describe Display do
  let(:display) { described_class.new }

  describe '#print' do
    context 'when viewing the board' do
      it 'returns the board' do
        board = [
          ['x', nil, nil],
          [nil, nil, nil],
          [nil, nil, nil]
        ]
        expect { display.print(board) }.to output(
          "x| | \n | | \n | | \n"
        ).to_stdout
      end
    end
  end
end
