require 'spec_helper'
require_relative '../lib/tic_tac_toe/player'

include TicTacToe

describe Player do
  subject(:player) { Player.new('X', board) }
  let(:board) { double("Board", :grid => [[' ',' '],[' ',' ']], :print => '', :count_cells => 9, :free_cells => "5")}

  describe '#initialize' do
    it 'has default name' do
      expect(player.name).to eq('Player X')
    end

    it 'sets player name' do
      player = Player.new('X', board, 'jerry')
      expect(player.name).to eq('jerry')
    end
  end

  describe '#get_move' do
    it 'returns cell number' do
      allow($stdin).to receive(:gets).and_return("5")
      expect(player.get_move).to eq("5")
    end

    it 'does not allow invalid entries' do
      allow($stdin).to receive(:gets).and_return("y","five","12","0", "5")
      expect(player.get_move).to eq("5")
    end
  end

end
