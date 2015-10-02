require_relative './board'
require_relative './human_player'
require_relative './computer_player'

module TicTacToe
  class Game
    attr_reader :player1, :player2, :board, :turns, :new_game
    attr_writer :new_game

    def initialize(player_1_class = Player, player_2_class = Player, player_1_name = nil, player_2_name = nil)
      @board    = Board.new
      @player1  = player_1_class.new(marker: 'X', board: @board, name: player_1_name)
      @player2  = player_2_class.new(marker: 'O', board: @board, name: player_2_name)
      @turns    = 0
    end

    def current_player
      turns.even? ? player1 : player2
    end

    def last_player
      turns.odd? ? player1 : player2
    end

    def play
      loop do
        if winner?
          puts board.print
          puts "#{last_player.name} wins!!"
          break
        elsif draw?
          puts board.print
          puts "It's a draw!!"
          break
        else
          print_intructions
          move
        end
      end
    end

    def move
      player = current_player

      board.print
      puts "#{player.name}'s turn."
      puts "Available moves: #{board.free_cells.join(', ')}\n\n"

      cell = player.move
      until board.set_cell(cell, player.marker)
        puts "\nSorry, cell already taken. Please try again\n\n"
        cell = player.move
      end

      @turns += 1
    end

    def print_intructions
      puts 'Choose a number between 1 and 9 to mark space in the grid'
      puts 'Place 3 marks in a horizontal, vertical, or diagonal row to wine.'
      puts
      puts "\t 1 | 2 | 3 "
      puts "\t --+---+-- "
      puts "\t 4 | 5 | 6 "
      puts "\t --+---+-- "
      puts "\t 7 | 8 | 9 "
      puts
    end

    def winner?
      board.complete_rows.count >= 1
    end

    def draw?
      turns >= board.count_cells
    end
  end
end
