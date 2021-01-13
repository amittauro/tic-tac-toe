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

  describe '#won?' do
    context 'when player1 has won the game' do
      it 'returns player1 has won for first column' do
        3.times { |row| tic_tac_toe.player1move(row, 0)}
        expect(tic_tac_toe.won?).to eq('Player1 has won the game')
      end

      it 'returns player1 has won for second column' do
        3.times { |row| tic_tac_toe.player1move(row, 1)}
        expect(tic_tac_toe.won?).to eq('Player1 has won the game')
      end

      it 'returns player1 has won for third column' do
        3.times { |row| tic_tac_toe.player1move(row, 2)}
        expect(tic_tac_toe.won?).to eq('Player1 has won the game')
      end

      it 'returns player1 has won for first row' do
        3.times { |column| tic_tac_toe.player1move(0, column)}
        expect(tic_tac_toe.won?).to eq('Player1 has won the game')
      end

      it 'returns player1 has won for second row' do
        3.times { |column| tic_tac_toe.player1move(1, column)}
        expect(tic_tac_toe.won?).to eq('Player1 has won the game')
      end

      it 'returns player1 has won for third row' do
        3.times { |column| tic_tac_toe.player1move(2, column)}
        expect(tic_tac_toe.won?).to eq('Player1 has won the game')
      end

      it 'returns player1 has won for first diagonal' do
        3.times { |i| tic_tac_toe.player1move(i, i)}
        expect(tic_tac_toe.won?).to eq('Player1 has won the game')
      end

      it 'returns player1 has won for second diagonal' do
        tic_tac_toe.player1move(2, 0)
        tic_tac_toe.player1move(1, 1)
        tic_tac_toe.player1move(0, 2)
        expect(tic_tac_toe.won?).to eq('Player1 has won the game')
      end
    end

    context 'when player2 has won the game' do
      it 'returns player2 has won for first column' do
        3.times { |row| tic_tac_toe.player2move(row, 0)}
        expect(tic_tac_toe.won?).to eq('Player2 has won the game')
      end

      it 'returns player2 has won for second column' do
        3.times { |row| tic_tac_toe.player2move(row, 1)}
        expect(tic_tac_toe.won?).to eq('Player2 has won the game')
      end

      it 'returns player2 has won for third column' do
        3.times { |row| tic_tac_toe.player2move(row, 2)}
        expect(tic_tac_toe.won?).to eq('Player2 has won the game')
      end
      #
      # it 'returns player2 has won for first row' do
      #   3.times { |column| tic_tac_toe.player2move(0, column)}
      #   expect(tic_tac_toe.won?).to eq('Player2 has won the game')
      # end
      #
      # it 'returns player2 has won for second row' do
      #   3.times { |column| tic_tac_toe.player2move(1, column)}
      #   expect(tic_tac_toe.won?).to eq('Player2 has won the game')
      # end
      #
      # it 'returns player2 has won for third row' do
      #   3.times { |column| tic_tac_toe.player2move(2, column)}
      #   expect(tic_tac_toe.won?).to eq('Player2 has won the game')
      # end
      #
      # it 'returns player2 has won for first diagonal' do
      #   3.times { |i| tic_tac_toe.player2move(i, i)}
      #   expect(tic_tac_toe.won?).to eq('Player2 has won the game')
      # end
      #
      # it 'rreturns player2move has won for second diagonal' do
      #   tic_tac_toe.player2move(2, 0)
      #   tic_tac_toe.player2move(1, 1)
      #   tic_tac_toe.player2move(0, 2)
      #   expect(tic_tac_toe.won?).to eq('Player2 has won the game')
      # end
    end
  end
end
