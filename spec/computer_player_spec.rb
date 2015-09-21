require 'spec_helper'
require_relative '../lib/computer_player'

describe ComputerPlayer do
  subject(:computer) { ComputerPlayer.new }

  it 'inherits from Player' do
    expect(ComputerPlayer.superclass).to be(Player)
  end

  it 'has own default name' do
    expect(computer.name).to eq('CP-T^3')
  end
end
