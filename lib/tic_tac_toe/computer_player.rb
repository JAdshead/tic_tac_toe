require_relative 'player'

class ComputerPlayer < Player

  def get_move
    possible_winning_moves.length > 0 ? possible_winning_moves.sample : available_moves.sample
  end

  def available_moves
    @board.free_cells
    # [2,4,5,6,7,9]
  end

  def own_moves
    @board.find_cells @marker
    # [1,3]
  end

  def possible_winning_moves
    winning_moves = winning_line_numbers.map do |line|
      arr = line - own_moves
      if arr.length == 1
        available_moves.include?(arr.first) ? arr.first : nil
      else
        nil
      end
    end

    winning_moves.compact
  end

  def opponent_moves
    (1..9).to_a - (own_moves + available_moves)
  end

  def winning_line_numbers
    [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,9]]
  end
end
