require './lib/setup'

describe Setup do
  describe '#players' do
    let(:player) { double('player', new: 'new player') }
    it 'returns an array of players' do
      setup = Setup.new(player)
      expect(setup.players).to eq(['new player', 'new player'])
    end
  end
end
