require './lib/tic_tac_toe'

describe TicTacToe do
  let(:tic_tac_toe) { TicTacToe.new }
  describe '#player1move' do
    context 'when making a move' do
      it 'returns the board with that move' do
        expect(tic_tac_toe.player1move(1, 1)).to eq(
          [[nil, nil, nil],
          [nil, 'x', nil],
          [nil, nil, nil]]
        )
      end
    end
  end

  describe '#player2move' do
    context 'when making a move' do
      it 'returns the board with that move' do
        expect(tic_tac_toe.player2move(2, 0)).to eq(
          [[nil, nil, nil],
          [nil, nil, nil],
          ['o', nil, nil]]
        )
      end
    end
  end

  describe '#player1won?' do
    context 'when player1 has won the game for a column' do
      it 'returns true' do
        tic_tac_toe.player1move(0, 0)
        tic_tac_toe.player1move(1, 0)
        tic_tac_toe.player1move(2, 0)
        expect(tic_tac_toe.player1won?).to eq(true)
      end
    end
  end
end
