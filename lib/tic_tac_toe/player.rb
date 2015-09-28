module TicTacToe
  class Player
    attr_reader :name, :marker, :board

    def initialize(args)
      @marker = args.fetch(:marker)
      @board  = args.fetch(:board)
      @name   = args[:name] || generate_name
    end

    def move
      move = $stdin.gets.chomp
      until move.to_i > 0 && move.to_i <= board.count_cells
        puts "invalid entry, please choose from #{board.free_cells}"
        move = $stdin.gets.chomp
      end
      move
    end

    private

    def generate_name
      self.class.to_s.sub('TicTacToe::', '') + ' ' + marker
    end
  end
end
