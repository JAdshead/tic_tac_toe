require 'spec_helper'
require_relative '../lib/player'

describe Player do
  subject(:player) { Player.new }

  it 'has default name' do
    expect(player.name).to eq('Player')
  end

  it 'sets player name' do
    player = Player.new('jerry')
    expect(player.name).to eq('jerry')
  end

end
