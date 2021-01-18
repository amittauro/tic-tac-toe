require './lib/app'

describe App do
  describe '#run' do
    context 'when setting up the game' do
      it 'runs' do
        player = double('player', new: nil)
        tic_tac_toe = double('tic_tac_toe')
        object = double('object')
        app = App.new(player, tic_tac_toe)
        allow(tic_tac_toe).to receive(:new).and_return(object)
        expect(object).to receive(:run)
        app.run
      end

      it 'runs tic tac toe' do
        player = double('player', new: nil)
        tic_tac_toe = double('tic_tac_toe')
        object = double('object')
        app = App.new(player, tic_tac_toe)
        allow(tic_tac_toe).to receive(:new).and_return(object)
        allow(object).to receive(:run).and_return('tic tac toe running')
        expect(app.run).to eq('tic tac toe running')
      end
    end
  end
end
