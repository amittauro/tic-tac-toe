require './lib/tic_tac_toe'

describe TicTacToe do
  describe '#play' do
    context 'when playing the game' do
      it 'asks the board to move with the input' do
        board = double('board', field_free?: true, move: nil)
        tic_tac_toe = TicTacToe.new(board)
        expect(tic_tac_toe.play('0 0')).to eq(['o', 'x'])
      end

      it 'calls upon board to move' do
        board = double('board', field_free?: true)
        tic_tac_toe = TicTacToe.new(board)
        expect(board).to receive(:move).with('0 0', 'x')
        tic_tac_toe.play('0 0')
      end

      it 'checks if field free' do
        board = double('board', move: nil)
        tic_tac_toe = TicTacToe.new(board)
        expect(board).to receive(:field_free?)
        tic_tac_toe.play('0 0')
      end
    end
  end

  describe '#over?' do
    context 'when checking if game is over' do
      it 'asks board to check if game is over' do
        board = double('board')
        tic_tac_toe = TicTacToe.new(board)
        expect(board).to receive(:over?).with('o')
        tic_tac_toe.over?
      end
    end
  end
end
