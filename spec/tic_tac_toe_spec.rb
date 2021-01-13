require './lib/tic_tac_toe'

describe TicTacToe do
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  let(:tic_tac_toe) { TicTacToe.new(player1, player2) }

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

  describe '#won?' do
    context 'when checking to see if a player has won the game' do
      it 'calls upon the player1 class' do
        expect(player1).to receive(:won?).with(tic_tac_toe.board)
        tic_tac_toe.won?
      end
    end
  end

  describe '#over' do
    context 'when all fiels are taken' do
      it 'returns the game is over' do
        3.times { |column| tic_tac_toe.player2move(0, column)}
        3.times { |column| tic_tac_toe.player1move(1, column)}
        3.times { |column| tic_tac_toe.player2move(2, column)}
        expect(tic_tac_toe.over).to eq('the game is over')
      end
    end
  end
end
