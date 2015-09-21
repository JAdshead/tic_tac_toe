class Player
  attr_reader :name

  def initialize(name = get_name)
    @name = name
  end

  def get_move
    puts "#{@name}'s turn. Choose cell (1-9)"
    move = gets.chomp
    return move
  end

  private

  def get_name
    'Player'
  end

end
