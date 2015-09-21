require_relative 'player'

class ComputerPlayer < Player

  def get_move
    rand(1..9)
  end

  private

  def get_name
    'CP-T^3' + @marker
  end
end
