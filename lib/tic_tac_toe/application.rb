require 'optparse'
require_relative './game'

module TicTacToe
  class Application
    attr_reader :options, :opt_parser

    def initialize(argv)
      process_options(argv)
      opt_parser.parse(argv)
      game_type(argv)
    end

    def setup_game(p1, p2, p1_name = nil, p2_name = nil)
      @game = Game.new(p1, p2, p1_name, p2_name)
      play
    end

    def play
      @game.play
    end

    def process_options(argv)
      @options = {}

      @opt_parser = OptionParser.new do |opt|
        opt.banner =  'Usage: tic_tac_toe COMMAND [OPTIONS]'
        opt.separator ''
        opt.separator 'Commands'
        opt.separator '     pvp: player   vs  player'
        opt.separator '     pvc: player   vs  computer'
        opt.separator '     cvp: computer vs  player'
        opt.separator '     pvp: computer vs  computer'
        opt.separator ''
        opt.separator 'Options'

        opt.on('-h', '--help', 'help') do
          puts opt_parser
        end

        opt.on('-n', '--names PLAYER1,PLAYER2', Array, 'Player names') do |names|
          options[:player1name] = names[0]
          options[:player2name] = names[1]
        end

        opt.separator ''
        opt.separator ''
      end
    end

    def game_type(argv)
      case argv[0]
      when 'pvp'
        setup_game(HumanPlayer, HumanPlayer, options[:player1name], options[:player2name])
      when 'pvc'
        setup_game(HumanPlayer, ComputerPlayer, options[:player1name], options[:player2name])
      when 'cvp'
        setup_game(ComputerPlayer, HumanPlayer, options[:player1name], options[:player2name])
      when 'cvc'
        setup_game(ComputerPlayer, ComputerPlayer, options[:player1name], options[:player2name])
      else
        puts opt_parser
      end
    end

  end
end
