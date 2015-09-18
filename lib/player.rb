class Player
  attr_reader :name

  def initialize(name = get_name)
    @name = name
  end

  private

  def get_name
    'Player'
  end

end
