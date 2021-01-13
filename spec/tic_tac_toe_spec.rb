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

  describe '#won' do
    context 'when checking to see if a player has won the game' do
      it 'calls upon the player1 class' do
        allow(player2).to receive(:won?)
        expect(player1).to receive(:won?).with(tic_tac_toe.board)
        tic_tac_toe.won
      end

      it 'calls upon the player2 class won method' do
        allow(player1).to receive(:won?)
        expect(player2).to receive(:won?).with(tic_tac_toe.board)
        tic_tac_toe.won
      end

      it 'returns player1 has won the game if true' do
        allow(player2).to receive(:won?)
        allow(player1).to receive(:won?).and_return(true)
        expect(tic_tac_toe.won).to eq('Player1 has won the game')
      end

      it 'returns player2 has won the game if true' do
        allow(player1).to receive(:won?)
        allow(player2).to receive(:won?).and_return(true)
        expect(tic_tac_toe.won).to eq('Player2 has won the game')
      end    
    end
  end

  describe '#over' do
    context 'when all fields are taken' do
      it 'returns the game is over' do
        3.times { |column| tic_tac_toe.player2move(0, column)}
        3.times { |column| tic_tac_toe.player1move(1, column)}
        3.times { |column| tic_tac_toe.player2move(2, column)}
        expect(tic_tac_toe.over).to eq('the game is over')
      end
    end
  end
end
