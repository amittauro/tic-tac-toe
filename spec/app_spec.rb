require './lib/app'

describe App do
  describe '#run' do
    context 'when running the app' do
      it 'ends the game if game is over' do
        tic_tac_toe = double('tic_tac_toe', over?: true, play: nil)
        app = App.new(tic_tac_toe)
        expect { app.run }.to output(/game over/).to_stdout
      end

      it 'asks tic tac toe to play' do
        tic_tac_toe = double('tic_tac_toe', over?: false)
        app = App.new(tic_tac_toe)
        allow(app).to receive(:gets).and_return('0 0', 'quit')
        expect(tic_tac_toe).to receive(:play).with('0 0')
        app.run
      end

      it 'asks tic tac toe to check if game is over' do
        tic_tac_toe = double('tic_tac_toe', play: nil)
        app = App.new(tic_tac_toe)
        allow(app).to receive(:gets).and_return('0 0', 'quit')
        expect(tic_tac_toe).to receive(:over?)
        app.run
      end
    end
  end
end
