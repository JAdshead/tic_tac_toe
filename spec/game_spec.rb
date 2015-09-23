require 'spec_helper'
require_relative '../lib/tic_tac_toe/game'

include TicTacToe

describe Game do
  subject(:game) { Game.new(Player, ComputerPlayer) }

  it 'initializes with players' do
    expect(game.player1.name).to eq('Player X')
    expect(game.player2.name).to eq('ComputerPlayer O')
  end

  describe '#current_player' do
    it 'returns player' do
      expect(game.current_player).to be_kind_of(Player)
      expect(game.current_player.name).to eq('Player X')
    end
  end
end
