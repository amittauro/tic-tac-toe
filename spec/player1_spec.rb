require './lib/player1'

describe Player1 do
  let(:player1) {Player1.new}
  describe '#won' do
    context 'when player1 wins the game' do
      it 'returns true' do
        board = array_column_win(0, 'x')
        expect(player1.won?(board)).to eq(true)
      end
    end
  end
end
