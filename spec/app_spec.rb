require './lib/app'

describe App do
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  let(:tic_tac_toe) { double('tic_tac_toe')}
  let(:app) { App.new(player1, player2, tic_tac_toe) }
  describe '#run' do
    context 'when player1 moves' do
      it 'gets the player1 move' do
        allow(app).to receive(:gets).and_return('0 0', 'quit')
        expect(tic_tac_toe).to receive(:player1move).with(0, 0)
        app.run
      end
    end
  end
end
