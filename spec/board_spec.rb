require 'spec_helper'
require_relative '../lib/board'

describe Board do
  subject(:board) { Board.new }
  let(:empty_grid) { [[' ',' ',' '],[' ', ' ',' '],[' ',' ',' ']] }
  let(:populated_grid) { [['X','O','X'],['O','O','O'],['X','X','X']] }

  it 'initializes with empty 3x3 grid with empty cells' do
    expect(board.grid).to eq(empty_grid)
  end

  it 'initializes with given grid' do
    grid = [[' ', ' '],[' ', ' ']]
    board = Board.new(grid)
    expect(board.grid).to eq(grid)
  end



  describe '#human_to_grid' do
  end

  describe '#set_cell' do
    it 'updates cell'
    it 'does not write over existing value'
  end

  describe '#get_cell' do
    it 'returns cell value'
  end

end
