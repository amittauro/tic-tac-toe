require './lib/tic_tac_toe'

describe TicTacToe do
  describe '#run' do
    context 'when game is over' do
      it 'outputs game over for player1 wins' do
        player1 = double('player', won?: true, move: nil)
        player2 = double('player', won?: false, move: nil)
        board = nil
        tic_tac_toe = TicTacToe.new([player1, player2], board)
        expect { tic_tac_toe.run }.to output("type ? for help\ngame over\n").to_stdout
      end

      it 'outputs game over for player2 wins' do
        player1 = double('player', won?: false, move: nil)
        player2 = double('player', won?: true, move: nil)
        board = nil
        tic_tac_toe = TicTacToe.new([player1, player2], board)
        expect { tic_tac_toe.run }.to output("type ? for help\ngame over\n").to_stdout
      end

      it 'outputs game over for board full' do
        player1 = double('player', won?: false, move: nil)
        player2 = double('player', won?: true, move: nil)
        board = [
          ['x', 'o', 'x'],
          ['o', 'x', 'o'],
          ['o', 'x', 'o']
        ]
        tic_tac_toe = TicTacToe.new([player1, player2], board)
        expect { tic_tac_toe.run }.to output("type ? for help\ngame over\n").to_stdout
      end
    end

    context 'when switching players' do
      it 'calls upon player1 and then player2' do
        player1 = double('player', won?: false)
        player2 = double('player', won?: false)
        board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
        tic_tac_toe = TicTacToe.new([player1, player2], board)
        allow(tic_tac_toe).to receive(:gets).and_return('0 0', '1 1', 'quit')
        expect(player1).to receive(:move).with('0 0')
        expect(player2).to receive(:move).with('1 1')
        tic_tac_toe.run
      end

      it 'doesnt call upon anyone when field taken' do
        player1 = double('player', won?: false)
        player2 = double('player', won?: false)
        board = [['x', nil, nil], [nil, nil, nil], [nil, nil, nil]]
        tic_tac_toe = TicTacToe.new([player1, player2], board)
        allow(tic_tac_toe).to receive(:gets).and_return('0 0', 'quit')
        expect(player1).to_not receive(:move)
        expect(player2).to_not receive(:move)
        tic_tac_toe.run
      end
    end
  end
end
