require 'spec_helper'
require_relative '../lib/board'

describe Board do
  subject(:board) { Board.new }
  let(:empty_grid) { [[' ',' ',' '],[' ', ' ',' '],[' ',' ',' ']] }

  it 'initializes with empty 3x3 grid with empty cells' do
    expect(board.grid).to eq(empty_grid)
  end

  describe 'Board#setCell' do
    it 'updates cell' do

    end
  end
end
