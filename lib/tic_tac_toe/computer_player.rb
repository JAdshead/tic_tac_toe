require 'x_and_os'
require_relative './nameable'

module TicTacToe
  class ComputerPlayer
    include XAndOs::GameMaster
    include Nameable

    attr_reader :board
    
    def move(board)
      @board = board
      best_move
    end
  end
end

