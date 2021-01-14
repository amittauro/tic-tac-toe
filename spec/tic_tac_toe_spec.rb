require './lib/tic_tac_toe'

describe TicTacToe do
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  let(:parser) { double('parser') }
  let(:tic_tac_toe) { TicTacToe.new(player1, player2, parser) }
  describe '#move' do
    context 'when playing a a game of tic tac toe' do
      it 'makes a move for player 1' do
        tic_tac_toe.move('0 0')
        expect(tic_tac_toe.board).to eq(
          [
            ['x', nil, nil],
            [nil, nil, nil],
            [nil, nil, nil]
          ]
        )
      end

      it 'makes a move for player 2 after player 1' do
        tic_tac_toe.move('1 1')
        tic_tac_toe.move('0 0')
        expect(tic_tac_toe.board).to eq(
          [
            ['o', nil, nil],
            [nil, 'x', nil],
            [nil, nil, nil]
          ]
        )
      end
    end
  end
end
