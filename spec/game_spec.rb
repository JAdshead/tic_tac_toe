require 'spec_helper'
require_relative '../lib/tic_tac_toe/game'

include TicTacToe

describe Game do
  subject(:game) { Game.new(Player, ComputerPlayer) }
  # let(:Player) { class_double("Player") }
  # let(:ComputerPlayer) { double("Player", :new=> p2) }
  # let(:p1) { double("Player", :name=> 'p1') }
  # let(:p2) { double("Player", :name=> 'p2') }

  it 'initializes with players' do
    expect(game.player1.name).to eq('Player X')
    expect(game.player2.name).to eq('ComputerPlayer O')
  end

  describe '#move' do
  end

  describe '#current_player' do
    it 'returns player' do
      expect(game.current_player).to be_kind_of(Player)
      expect(game.current_player.name).to eq('Player X')
    end
  end
end
