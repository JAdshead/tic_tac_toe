require 'spec_helper'
require_relative '../lib/tic_tac_toe/player'

describe Player do
  subject(:player) { Player.new('X', board) }
  let(:board) { double("Board", :grid => [[' ',' '],[' ',' ']]) }

  describe '#initialize' do
    it 'has default name' do
      expect(player.name).to eq('Player X')
    end

    it 'sets player name' do
      player = Player.new('X', board, 'jerry')
      expect(player.name).to eq('jerry')
    end
  end

end
