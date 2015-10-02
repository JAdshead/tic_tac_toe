require 'spec_helper'
require_relative '../lib/tic_tac_toe/human_player'

include TicTacToe

describe HumanPlayer do
  subject(:player) { HumanPlayer.new(marker: 'X', board: board) }
  let(:board) { double("Board", :grid => [[' ',' '],[' ',' ']], :print => '', :count_cells => 9, :free_cells => "5")}

  describe '#move' do
    it 'returns cell number' do
      allow($stdin).to receive(:gets).and_return("5")
      expect(player.move).to eq("5")
    end

    it 'does not allow invalid entries' do
      allow($stdin).to receive(:gets).and_return("y","five","12","0", "5")
      expect(player.move).to eq("5")
    end
  end

end
