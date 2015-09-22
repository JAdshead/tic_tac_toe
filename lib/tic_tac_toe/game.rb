require_relative './board'
require_relative './player'
require_relative './computer_player'

class Game
  attr_reader :player1, :player2

  def initialize(player_1_class = Player, player_2_class = Player, player_1_name=nil, player_2_name=nil)
    @board   = Board.new
    @player1 = player_1_class.new('X',@board, player_1_name)
    @player2 = player_2_class.new('O',@board, player_1_name)
    @turns   = 0
  end

  def current_player
    @turns % 2 == 0 ? @player1 : @player2
  end

  def last_player
    @turns % 2 == 1 ? @player1 : @player2
  end

  def play_game
    if is_winner?
      puts "#{last_player.name} wins!!"
    elsif is_draw?
      puts "It's a draw!!"
    else
      move
    end
  end

  def move
    player = current_player
    puts "#{player.name}'s turn. Available moves: #{@board.free_cells.join(', ')}\n\n"

    cell = player.get_move

    until @board.set_cell(cell, player.marker)
      puts "\nSorry, cell already taken. Please try again\n\n"
      cell = player.get_move
    end

    @turns += 1

    play_game
  end

  def is_winner?
    @board.uniq_rows.count >= 1
  end

  def is_draw?
    @turns >= @board.count_cells
  end

end
