require 'x_and_os'

module TicTacToe
  class ComputerPlayer
    include XAndOs::GameMaster
    
    def move
      best_move
    end
  end
end

