require './lib/app'
require './lib/player'
require './lib/tic_tac_toe'
require './lib/display'
require './lib/players'

describe 'feature' do
  let(:app) { App.new }
  context 'when running the app' do
    it 'asks for help' do
      allow(app).to receive(:gets).and_return('quit')
      expect { app.run }.to output(/help/).to_stdout
    end

    it 'shows board with player 1 input' do
      allow(app).to receive(:gets).and_return('0 0', 'quit')
      expect { app.run }.to output(/x| | /).to_stdout
    end

    it 'shows board with player 2 input' do
      allow(app).to receive(:gets).and_return('0 0', '1 1', 'quit')
      expect { app.run }.to output(/ |o| /).to_stdout
    end

    it 'ends game when a player wins on row 1' do
      allow(app).to receive(:gets).and_return('0 0', '1 1', '0 1', '1 2', '0 2')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'ends game when a player wins on row 2' do
      allow(app).to receive(:gets).and_return('1 0', '0 1', '1 1', '0 2', '1 2')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'ends game when a player wins on row 3' do
      allow(app).to receive(:gets).and_return('2 0', '1 1', '2 1', '1 2', '2 2')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'ends game when a player wins on row 3' do
      allow(app).to receive(:gets).and_return('2 0', '1 1', '2 1', '1 2', '2 2')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'ends game when a player wins on column 1' do
      allow(app).to receive(:gets).and_return('0 0', '1 1', '1 0', '1 2', '2 0')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'ends game when a player wins on column 2' do
      allow(app).to receive(:gets).and_return('0 1', '2 2', '1 1', '1 2', '2 1')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'ends game when a player wins on column 3' do
      allow(app).to receive(:gets).and_return('0 2', '1 1', '1 2', '2 1', '2 2')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'ends game when a player wins on a diagonal' do
      allow(app).to receive(:gets).and_return('0 0', '2 1', '1 1', '1 2', '2 2')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'ends game when a player wins on another diagonal' do
      allow(app).to receive(:gets).and_return('0 2', '2 1', '1 1', '1 2', '2 0')
      expect { app.run }.to output(/game over/).to_stdout
    end

    it 'doesnt move if field taken' do
      allow(app).to receive(:gets).and_return('0 0', '0 0', 'quit')
      expect { app.run }.to output(/x| | /).to_stdout
    end
  end
end
