require './lib/app'

describe App do
  let(:player1) { double('player1') }
  let(:player2) { double('player2') }
  let(:tic_tac_toe) { double('tic_tac_toe')}
  let(:app) { App.new(player1, player2, tic_tac_toe) }
  describe '#run' do
    context 'when player moves' do
      it 'gets the player1 move' do
        allow(app).to receive(:gets).and_return('0 0', 'quit')
        allow(player1).to receive(:won?)
        expect(tic_tac_toe).to receive(:player1move).with(0, 0)
        app.run
      end

      it 'gets the player2 move after player1 move' do
        allow(app).to receive(:gets).and_return('0 0', '1 1', 'quit')
        allow(player1).to receive(:won?)
        allow(tic_tac_toe).to receive(:player1move)
        expect(tic_tac_toe).to receive(:player2move).with(1, 1)
        app.run
      end
    end

    context 'when checking who won' do
      it 'stops and returns the winner' do
        allow(app).to receive(:gets).and_return('0 0')
        allow(player1).to receive(:won?)
        allow(player1).to receive(:won?).and_return(true)
        expect{ (app.run) }.to output("player1 has won the game\n").to_stdout
      end
    end
  end
end
