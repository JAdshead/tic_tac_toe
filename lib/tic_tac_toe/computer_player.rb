require_relative 'player'

class ComputerPlayer < Player

  def get_move
    available_moves.sample
  end

  def available_moves
    @board.free_cells
  end

end
