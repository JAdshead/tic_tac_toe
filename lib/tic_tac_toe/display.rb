module TicTacToe
  class Display

    def self.game_board(board)
      to_print = board.dup
      puts
      while to_print.length > 1
        row = to_print.shift
        puts "\t " + row.flatten.join(' | ')
        puts "\t --+---+--"
      end
      row = to_print.shift
      puts "\t " + row.flatten.join(' | ')
      puts
    end
  end
  
end