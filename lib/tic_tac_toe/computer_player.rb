require_relative 'player'
require 'x_and_os'

module TicTacToe
  class ComputerPlayer < Player
    include XAndOs::GameMaster
    
    def move
      best_move
    end
  end
end

