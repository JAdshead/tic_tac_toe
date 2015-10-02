require 'spec_helper'
require_relative '../lib/tic_tac_toe/player'

include TicTacToe

describe Player do
  subject(:player) { Player.new(marker: 'X', board: board) }
  let(:board) { double("Board")}

  describe '#initialize' do
    it 'has default name' do
      expect(player.name).to eq('Player X')
    end

    it 'sets player name' do
      player = Player.new(marker: 'X', board: board, name: 'jerry')
      expect(player.name).to eq('jerry')
    end
  end

end
