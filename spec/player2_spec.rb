require './lib/player2'

describe Player2 do
  let(:player2) {Player2.new}
  describe '#won' do
    context 'when player2 wins the game' do
      it 'returns true for first column' do
        board = array_column_win(0, 'o')
        expect(player2.won?(board)).to eq(true)
      end

      it 'returns true for second column' do
        board = array_column_win(1, 'o')
        expect(player2.won?(board)).to eq(true)
      end

      it 'returns true for third column' do
        board = array_column_win(2, 'o')
        expect(player2.won?(board)).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'o')
        expect(player2.won?(board)).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'o')
        expect(player2.won?(board)).to eq(true)
      end

      it 'returns true for first row' do
        board = array_row_win(0, 'o')
        expect(player2.won?(board)).to eq(true)
      end

      it 'returns true for first diagonal' do
        board = [
          ['o', nil, nil],
          [nil, 'o', nil],
          [nil, nil, 'o']
        ]
        expect(player2.won?(board)).to eq(true)
      end

      it 'returns true for first diagonal' do
        board = [
          [nil, nil, 'o'],
          [nil, 'o', nil],
          ['o', nil, nil]
        ]
        expect(player2.won?(board)).to eq(true)
      end
    end
  end
end
