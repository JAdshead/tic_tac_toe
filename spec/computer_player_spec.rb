require 'spec_helper'
require_relative '../lib/tic_tac_toe/computer_player'

describe ComputerPlayer do
  subject(:computer) { ComputerPlayer.new('X', board) }
  let(:board) { double("Board", :count_cells => 9) }

  it 'inherits from Player' do
    expect(ComputerPlayer.superclass).to be(Player)
  end

  it 'has own default name' do
    expect(computer.name).to eq('ComputerPlayer X')
  end

  describe '#get_move' do
    it 'returns value for cell' do
      expect(computer.get_move).to be_between(1, 4)
    end

    it 'does not return taken a value for taken cell' do
      allow(board).to receive(:grid) { [['x','o','x'],[' ','o','x'],['x','o','x']] }

      computer = ComputerPlayer.new('x',board)
      expect(computer.get_move).to eq(4)
    end

    xit 'has killer instict' do
    end

    xit 'will defend' do
    end

    xit 'it will fork - create two oppotunities to win' do
    end

    xit 'it block fork'

    xit 'it will choose center'

    xit 'it will go opposite corner'

    xit 'it will pick empty corner'

    xit 'it will pick empty side'

  end

end
