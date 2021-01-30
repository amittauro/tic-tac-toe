# frozen_string_literal: true

require './lib/tic_tac_toe'

describe TicTacToe do
  describe '#play' do
    context 'when playing the game' do
      it 'asks the board to move with the input' do
        board = instance_double('board', field_free?: true, move: nil)
        tic_tac_toe = described_class.new(board)
        expect(tic_tac_toe.play('0 0')).to eq(%w[o x])
      end

      it 'calls upon board to move' do
        board = spy('board', field_free?: true)
        tic_tac_toe = described_class.new(board)
        tic_tac_toe.play('0 0')
        expect(board).to have_received(:move).with('0 0', 'x')
      end

      it 'checks if field free' do
        board = spy('board', move: nil)
        tic_tac_toe = described_class.new(board)
        tic_tac_toe.play('0 0')
        expect(board).to have_received(:field_free?)
      end
    end
  end

  describe '#over?' do
    context 'when checking if game is over' do
      it 'asks board to check if game is over' do
        board = spy('board')
        tic_tac_toe = described_class.new(board)
        tic_tac_toe.over?
        expect(board).to have_received(:over?).with('o')
      end
    end
  end
end
