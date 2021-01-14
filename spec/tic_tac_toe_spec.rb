require './lib/tic_tac_toe'

describe TicTacToe do
  describe '#move' do
    context 'when playing a a game of tic tac toe' do
      let(:player1) { double('player1', won?: false) }
      let(:player2) { double('player2', won?: false) }
      let(:parser) { double('parser', valid?: true) }
      let(:view) { double('view', show: nil) }
      let(:tic_tac_toe) { TicTacToe.new(player1, player2, parser, view) }
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

      it 'returns false if all fields are taken' do
        tic_tac_toe.move('0 0')
        tic_tac_toe.move('0 1')
        tic_tac_toe.move('0 2')
        tic_tac_toe.move('1 0')
        tic_tac_toe.move('1 2')
        tic_tac_toe.move('1 1')
        tic_tac_toe.move('2 0')
        tic_tac_toe.move('2 1')
        expect(tic_tac_toe.move('2 2')).to eq(false)
      end
    end

    context 'when checking valid input' do
      let(:player1) { double('player1', won?: false) }
      let(:player2) { double('player2', won?: false) }
      let(:parser) { double('parser') }
      let(:view) { double('view', show: nil) }
      let(:tic_tac_toe) { TicTacToe.new(player1, player2, parser, view) }
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

    context 'when there is a winner' do
      let(:player1) { double('player1') }
      let(:player2) { double('player2') }
      let(:parser) { double('parser', valid?: true) }
      let(:view) { double('view', show: nil) }
      let(:tic_tac_toe) { TicTacToe.new(player1, player2, parser, view) }
      it 'checks the game for player1 or player2 winning' do
        expect(player1).to receive(:won?).with(tic_tac_toe.board)
        expect(player2).to receive(:won?).with(tic_tac_toe.board)
        tic_tac_toe.move('0 0')
      end

      it 'returns false if player1 wins' do
        allow(player1).to receive(:won?).and_return(true)
        allow(player2).to receive(:won?).and_return(false)
        expect(tic_tac_toe.move('0 0')).to eq(false)
      end

      it 'returns false if player2 wins' do
        allow(player1).to receive(:won?).and_return(false)
        allow(player2).to receive(:won?).and_return(true)
        expect(tic_tac_toe.move('0 0')).to eq(false)
      end
    end
  end

  describe '#show board' do
    let(:player1) { double('player1') }
    let(:player2) { double('player2') }
    let(:parser) { double('parser', valid?: true) }
    let(:view) { double('view') }
    let(:tic_tac_toe) { TicTacToe.new(player1, player2, parser, view) }
    it 'asks the view class to show board' do
      expect(view).to receive(:show).with(tic_tac_toe.board)
      tic_tac_toe.show_board
    end
  end
end
