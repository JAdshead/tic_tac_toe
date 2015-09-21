require_relative 'player'

class ComputerPlayer < Player

  def get_move
    puts "#{@name}'s turn"
    rand(1..9)
  end

  private

  def get_name
    'CP-T^3'
  end
end
