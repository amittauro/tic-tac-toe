# frozen_string_literal: true

require './lib/board'

describe Board do
  describe '#move' do
    context 'when making a move' do
      it 'returns the board with the move' do
        display = instance_double('display')
        board = described_class.new(display)
        allow(display).to receive(:print)
        expect(board.move('0 0', 'x')).to eq(
          [['x', nil, nil],
           [nil, nil, nil],
           [nil, nil, nil]]
        )
      end

      it 'asks display to print' do
        display = spy('display')
        board = described_class.new(display)
        board.move('0 0', 'x')
        expect(display).to have_received(:print)
      end
    end
  end

  describe '#field_free?' do
    let(:display) { instance_double('display', print: nil) }
    let(:board) { described_class.new(display) }

    context 'when checking if field is free' do
      it 'return true if field is free' do
        expect(board.field_free?('0 0')).to eq(true)
      end

      it 'returns false if field is taken' do
        board.move('0 0', 'x')
        expect(board.field_free?('0 0')).to eq(false)
      end
    end
  end

  describe '#over?' do
    let(:display) { instance_double('display', print: nil) }
    let(:board) { described_class.new(display) }

    context 'when player wins the game' do
      it 'returns true for first column' do
        board.move('0 0', 'x')
        board.move('1 0', 'x')
        board.move('2 0', 'x')
        expect(board.over?('x')).to eq(true)
      end

      it 'returns true for second column' do
        board.move('0 1', 'x')
        board.move('1 1', 'x')
        board.move('2 1', 'x')
        expect(board.over?('x')).to eq(true)
      end

      it 'returns true for third column' do
        board.move('0 2', 'x')
        board.move('1 2', 'x')
        board.move('2 2', 'x')
        expect(board.over?('x')).to eq(true)
      end

      it 'returns true for first row' do
        board.move('0 0', 'x')
        board.move('0 1', 'x')
        board.move('0 2', 'x')
        expect(board.over?('x')).to eq(true)
      end

      it 'returns true for second row' do
        board.move('1 0', 'x')
        board.move('1 1', 'x')
        board.move('1 2', 'x')
        expect(board.over?('x')).to eq(true)
      end

      it 'returns true for third row' do
        board.move('2 0', 'x')
        board.move('2 1', 'x')
        board.move('2 2', 'x')
        expect(board.over?('x')).to eq(true)
      end

      it 'returns true for first diagonal' do
        board.move('0 0', 'x')
        board.move('1 1', 'x')
        board.move('2 2', 'x')
        expect(board.over?('x')).to eq(true)
      end

      it 'returns true for second diagonal' do
        board.move('2 0', 'x')
        board.move('1 1', 'x')
        board.move('0 2', 'x')
        expect(board.over?('x')).to eq(true)
      end
    end

    context 'when game isnt over' do
      it 'returns false' do
        board.move('0 0', 'x')
        board.move('1 0', 'x')
        board.move('1 1', 'x')
        expect(board.over?('x')).to eq(false)
      end
    end
  end
end
