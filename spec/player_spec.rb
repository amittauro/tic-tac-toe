require './lib/player'

describe Player do
  describe '#move' do
    let(:board) { [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]] }
    let(:display) { double('display') }
    let(:player) { Player.new('x', board, display) }
    context 'when making a move' do
      it 'returns the board with the move' do
        allow(display).to receive(:print)
        expect(player.move('0 0')).to eq([
          ['x', nil, nil],
          [nil, nil, nil],
          [nil, nil, nil]
        ])
      end

      it 'asks display to print' do
        expect(display).to receive(:print).with(player.board)
        player.move('0 0')
      end
    end
  end

  describe '#won' do
    context 'when player wins the game' do
      it 'returns true for first column' do
        board = array_column_win(0, 'x')
        display = double('display')
        player = Player.new('x', board, display)
        expect(player.won?).to eq(true)
      end

      it 'returns true for second column' do
        board = array_column_win(1, 'x')
        display = double('display')
        player = Player.new('x', board, display)
        expect(player.won?).to eq(true)
      end

      it 'returns true for third column' do
        board = array_column_win(2, 'x')
        display = double('display')
        player = Player.new('x', board, display)
        expect(player.won?).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'x')
        display = double('display')
        player = Player.new('x', board, display)
        expect(player.won?).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'x')
        display = double('display')
        player = Player.new('x', board, display)
        expect(player.won?).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'x')
        display = double('display')
        player = Player.new('x', board, display)
        expect(player.won?).to eq(true)
      end

      it 'returns true for first diagonal' do
        board = [
          ['x', nil, nil],
          [nil, 'x', nil],
          [nil, nil, 'x']
        ]
        display = double('display')
        player = Player.new('x', board, display)
        expect(player.won?).to eq(true)
      end

      it 'returns true for first diagonal' do
        board = [
          [nil, nil, 'x'],
          [nil, 'x', nil],
          ['x', nil, nil]
        ]
        display = double('display')
        player = Player.new('x', board, display)
        expect(player.won?).to eq(true)
      end
    end
  end
end
