require 'optparse'

require_relative './game'

module TicTacToe
  class Application
    def initialize(argv)
      process_options(argv)
    end

    private

    def setup_game(p1, p2)
      @game = Game.new(p1, p2)
      play
    end

    def play
      @game.play_game
    end

    def process_options argv
      options = {}

      opt_parser = OptionParser.new do |opt|
        opt.banner =   "Usage: tic_tac_toe COMMAND [OPTIONS]"
        opt.separator  ""
        opt.separator  "Commands"
        opt.separator  "     pvp: player   vs  player"
        opt.separator  "     pvc: player   vs  computer"
        opt.separator  "     cvp: computer vs  player"
        opt.separator  "     pvp: computer vs  computer"
        opt.separator  ""
        opt.separator  "Options"

  
        opt.on('-h','--help','help') do
          puts opt_parser
        end

        opt.separator  ""
        opt.separator  ""

      end

      opt_parser.parse(argv)

      case argv[0]
      when "pvp"
        puts
        puts 'Player Vs Player'
        puts
        setup_game(Player, Player)
      when "pvc"
        puts
        puts 'Player Vs Computer'
        puts
        setup_game(Player, ComputerPlayer)
      when "cvp"
        puts
        puts 'Computer Vs Player'
        puts
        setup_game(ComputerPlayer, Player)
      when "cvc"
        puts
        puts 'Computer Vs Computer'
        puts
        setup_game(ComputerPlayer, ComputerPlayer)
      else
        puts opt_parser
      end
    end
  end
end
