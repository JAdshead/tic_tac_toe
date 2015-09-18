require 'spec_helper'
require_relative '../lib/board'

describe Board do
  subject(:board) { Board.new }
  let(:empty_grid) { [[' ',' ',' '],[' ', ' ',' '],[' ',' ',' ']] }
  let(:populated_grid) { [['X','O','X'],['O','O','O'],['X','X','X']] }

  it 'initializes with 3x3 \' \' grid when no values given' do
    expect(board.grid).to eq(empty_grid)
  end

  it 'initializes with given rows and columns' do
    grid = [[' ', ' ', ' '],[' ',' ', ' ']]
    board = Board.new(2,3)
    expect(board.grid).to eq(grid)
  end

  describe '#human_to_grid' do
    it 'takes human cell number, returns row and colunn' do
      expect(board.human_to_grid(7)).to eq([2,0])
    end

    it 'handles int as string' do
      expect(board.human_to_grid('2')).to eq([0,1])
    end

    context 'with a 5x5 (non default) grid' do
      board = Board.new(5,5)

      it 'takes human cell number, returns row and column' do
        expect(board.human_to_grid(12)).to eq([2,1])
      end
    end
  end

  describe '#set_cell' do
    it 'updates cell' do
      board.set_cell(3,'X')
      board.set_cell(3,'X')
      expect(board.grid[0][2]).to eq('X')
    end

    it 'does not write over existing value' do
      board.set_cell(3,'X')
      board.set_cell(3,'O')
      expect(board.grid[0][2]).to eq('X')
    end
  end

  describe '#get_cell' do
    it 'returns cell value' do
      board.set_cell(3,'X')
      expect(board.get_cell(3)).to eq('X')
    end
  end

  describe '#print' do
    it 'prints to STDOUT' do
      expect(STDOUT).to receive(:puts).exactly(5).times
      board.print
    end

    context 'with a 5x5 (non default) grid' do
      board = Board.new(5,5)
      it 'prints to STDOUT' do
        expect(STDOUT).to receive(:puts).exactly(9).times
        board.print
      end
    end

  end

end
