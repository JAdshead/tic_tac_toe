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

  describe '#get_move' do
    it 'returns value for cell'  do
      expect(computer.get_move).to be_between(1, 9)
    end
  end
end
