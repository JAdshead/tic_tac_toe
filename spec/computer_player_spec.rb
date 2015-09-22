require 'spec_helper'
require_relative '../lib/tic_tac_toe/computer_player'

describe ComputerPlayer do
  subject(:computer) { ComputerPlayer.new('X', board) }
  let(:board) { double("Board", :free_cells => [1,2,3,4,5,6,7,8,9], :find_cells =>[], :count_cells => 9)}

  it 'inherits from Player' do
    expect(ComputerPlayer.superclass).to be(Player)
  end

  it 'has own default name' do
    expect(computer.name).to eq('ComputerPlayer X')
  end

  describe '#get_move' do
    it 'returns value for cell' do
      expect(computer.get_move).to be_between(1, 9)
    end

    it 'does not return a value for taken cell' do
      allow(board).to receive(:free_cells) { [4]}
      computer = ComputerPlayer.new('x',board)
      expect(computer.get_move).to eq(4)
    end

    it 'has killer instict' do
      allow(board).to receive(:free_cells) {[2,4,5,6,7,8,9]}
      allow(board).to receive(:find_cells).with('x') {[1,3]}
      computer = ComputerPlayer.new('x',board)

      # run get_move 6times to minimize chance causing pass
      results = []
      6.times { results << computer.get_move }

      expect(results).to eq([2,2,2,2,2,2])
    end

    it 'will defend' do
      allow(board).to receive(:free_cells) {[2,3,4,6,8,9]}
      allow(board).to receive(:find_cells).with('o') {[5]}
      computer = ComputerPlayer.new('o',board)

      results = []
      6.times { results << computer.get_move }

      expect(results).to eq([4,4,4,4,4,4])
    end

    it 'it will fork - create two oppotunities to win' do
      allow(board).to receive(:free_cells) {[1,3,4,7,9]}
      allow(board).to receive(:find_cells).with('x') {[6,8]}
      computer = ComputerPlayer.new('x',board)

      results = []
      6.times { results << computer.get_move }

      expect(results).to eq([9,9,9,9,9,9])
    end

    it 'forces opponent to block, block does not create forking move' do
      allow(board).to receive(:free_cells).and_return( [2,3,4,5,6,8,9] )
      allow(board).to receive(:find_cells).with('x') {[1]}
      computer = ComputerPlayer.new('x',board)

      results = []
      6.times { results << computer.get_move }

      expect(results).not_to include(4,5,6,8)
    end

    it 'it blocks fork' do
      allow(board).to receive(:free_cells) {[1,3,4,5,7,9]}
      allow(board).to receive(:find_cells).with('o') {[2]}
      computer = ComputerPlayer.new('o',board)

      results = []
      6.times { results << computer.get_move }

      expect(results).to eq([9,9,9,9,9,9])
    end

    it 'it will choose center' do
      allow(board).to receive(:free_cells).and_return( [1,2,4,5,6,7,8,9],[1,3,4,5,6,7,8,9],[1,2,3,4,5,7,8,9] )
      allow(board).to receive(:find_cells).with('o') {[]}
      computer = ComputerPlayer.new('o',board)

      results = []
      6.times { results << computer.get_move }

      expect(results).to eq([5,5,5,5,5,5])
    end


    xit 'it will pick empty corner'

    xit 'it will pick empty side'

    it 'it will pick corner if first move' do
      expect(computer.get_move).to be(1)
    end
  end

  describe '#opponent_moves' do
    it 'returns moves made by opponent' do
      allow(board).to receive(:free_cells) {[1,3,4,7,9]}
      allow(board).to receive(:find_cells).with('x') {[6,8]}
      computer = ComputerPlayer.new('x',board)

      expect(computer.opponent_moves).to eq([2,5])
    end
  end

end
