require './lib/tic_tac_toe'

describe TicTacToe do
  describe '#play' do
    context 'when playing the game' do
      it 'asks the board to move with the input' do
        board = double('board')
        markers = double('markers', current_marker: 'x', reverse: nil)
        expect(board).to receive(:move).with('0 0', markers.current_marker)
      end
    end
  end
end
