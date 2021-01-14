require './lib/tic_tac_toe'

describe TicTacToe do
  describe '#move' do
    context 'when playing a a game of tic tac toe' do
      let(:player1) { double('player1') }
      let(:player2) { double('player2') }
      let(:parser) { double('parser', valid?: true) }
      let(:tic_tac_toe) { TicTacToe.new(player1, player2, parser) }
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

      it 'returns true after moves are made' do
        expect(tic_tac_toe.move('1 1')).to eq(true)
      end

      it 'doesnt move if field is taken' do
        tic_tac_toe.move('1 1')
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

    context 'when checking valid input' do
      let(:player1) { double('player1') }
      let(:player2) { double('player2') }
      let(:parser) { double('parser') }
      let(:tic_tac_toe) { TicTacToe.new(player1, player2, parser) }
      it 'doesnt move for invalid input' do
        allow(parser).to receive(:valid?).and_return(false)
        tic_tac_toe.move('4 4')
        expect(tic_tac_toe.board).to eq(
          [
            [nil, nil, nil],
            [nil, nil, nil],
            [nil, nil, nil]
          ]
        )
      end

      it 'asks parser to validate' do
        expect(parser).to receive(:valid?).with('a c')
        tic_tac_toe.move('a c')
      end
    end
  end
end
