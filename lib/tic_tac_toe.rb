require_relative './tic_tac_toe/game'

if __FILE__ == $0
  tic_tac_toe = Game.new(Player, ComputerPlayer)
  tic_tac_toe.play_game
end
