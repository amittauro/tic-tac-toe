require './lib/view'

describe View do
  let(:view) { View.new }
  describe '#show_board' do
    context 'when viewing the board' do
      it 'returns the board' do
        board = [
          ['x', nil, nil],
          [nil, nil, nil],
          [nil, nil, nil]
        ]
        expect {view.show(board) }.to output(
          "x| | \n | | \n | | \n"
        ).to_stdout
      end
    end
  end
end
