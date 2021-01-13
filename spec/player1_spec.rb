require './lib/player1'

describe Player1 do
  let(:player1) {Player1.new}
  describe '#won' do
    context 'when player1 wins the game' do
      it 'returns true for first column' do
        board = array_column_win(0, 'x')
        expect(player1.won?(board)).to eq(true)
      end

      it 'returns true for second column' do
        board = array_column_win(1, 'x')
        expect(player1.won?(board)).to eq(true)
      end

      it 'returns true for third column' do
        board = array_column_win(2, 'x')
        expect(player1.won?(board)).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'x')
        expect(player1.won?(board)).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'x')
        expect(player1.won?(board)).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'x')
        expect(player1.won?(board)).to eq(true)
      end

      it 'returns true for first diagonal' do
        board = [
          ['x', nil, nil],
          [nil, 'x', nil],
          [nil, nil, 'x']
        ]
        expect(player1.won?(board)).to eq(true)
      end

      it 'returns true for first diagonal' do
        board = [
          [nil, nil, 'x'],
          [nil, 'x', nil],
          ['x', nil, nil]
        ]
        expect(player1.won?(board)).to eq(true)
      end
    end
  end
end
