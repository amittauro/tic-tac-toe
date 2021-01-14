require './lib/app'

describe App do
  describe '#run' do
    context 'when moves are made' do
      let(:tic_tac_toe) { double('tic_tac_toe', move: true) }
      let(:app) { App.new(tic_tac_toe) }
      it 'takes player input until user types quit' do
        allow(app).to receive(:gets).and_return('0 0', 'quit')
        expect { app.run }.to output("you quit the game\n").to_stdout
      end
    end
  end
end
