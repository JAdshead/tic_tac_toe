module TicTacToe
  class Player
    attr_reader :name, :marker, :board

    def initialize(args)
      @marker = args.fetch(:marker)
      @board  = args.fetch(:board)
      @name   = args[:name] || generate_name
    end

    private

    def generate_name
      self.class.to_s.sub('TicTacToe::', '') + ' ' + marker
    end
  end
end
