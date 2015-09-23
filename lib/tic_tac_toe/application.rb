require_relative './game'

module TicTacToe
  class Application
    def initialize(argv)
      @game = Game.new(Player,ComputerPlayer)
    end

    def play
      @game.play_game
    end

  end
end
