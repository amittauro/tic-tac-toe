require './lib/app'

describe App do
  describe '#run' do
    context 'when moves are made' do
      let(:tic_tac_toe) { double('tic_tac_toe', move: true) }
      let(:app) { App.new(tic_tac_toe) }
      it 'takes player input until user types quit' do
        allow(app).to receive(:gets).and_return('0 0', 'quit')
        expect { app.run }.to output("type ? for help\nyou quit the game\ngame over\n").to_stdout
      end
    end

    context 'when game is over' do
      let(:tic_tac_toe) { double('tic_tac_toe', move: false) }
      let(:app) { App.new(tic_tac_toe) }
      it 'stops the game when its over' do
        allow(app).to receive(:gets).and_return('0 0')
        expect { app.run }.to output("type ? for help\ngame over\n").to_stdout
      end
    end
  end
end
