module TicTacToe
  class HumanPlayer

    def move
      move = $stdin.gets.chomp
      # until move.to_i > 0 && move.to_i <= board.count_cells
      #   puts "invalid entry, please choose from #{board.free_cells}"
      #   move = $stdin.gets.chomp
      # end
      # move
    end
  end
end
