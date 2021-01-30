# frozen_string_literal: true

require './lib/app'

describe App do
  describe '#run' do
    context 'when running the app' do
      it 'ends the game if game is over' do
        tic_tac_toe = instance_double('tic_tac_toe', over?: true, play: nil)
        app = described_class.new(tic_tac_toe)
        expect { app.run }.to output(/game over/).to_stdout
      end

      it 'asks tic tac toe to play' do
        tic_tac_toe = spy('tic_tac_toe', over?: false)
        app = described_class.new(tic_tac_toe)
        allow(app).to receive(:gets).and_return('0 0', 'quit')
        app.run
        expect(tic_tac_toe).to have_received(:play).with('0 0')
      end

      it 'asks tic tac toe to check if game is over' do
        tic_tac_toe = spy('tic_tac_toe', play: nil)
        app = described_class.new(tic_tac_toe)
        allow(app).to receive(:gets).and_return('0 0', 'quit')
        app.run
        expect(tic_tac_toe).to have_received(:over?)
      end
    end
  end
end
