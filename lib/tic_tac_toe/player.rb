module TicTacToe
  class Player
    attr_reader :name, :marker

    def initialize(marker, board, name = nil)
      @marker = marker
      @board  = board
      @name   = name || get_name
    end

    def get_move
      @board.print
      $stdin.gets.chomp
    end

    private
    def get_name
      self.class.to_s.sub('TicTacToe::','') + ' ' + @marker
    end
  end
end
