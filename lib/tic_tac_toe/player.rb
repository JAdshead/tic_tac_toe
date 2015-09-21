class Player
  attr_reader :name, :marker

  def initialize(marker, board, name = nil)
    @marker = marker
    @board  = board
    @name   = name || get_name
  end

  def get_move
    gets.chomp
  end

  private

  def get_name
    'Player ' + @marker
  end

end
