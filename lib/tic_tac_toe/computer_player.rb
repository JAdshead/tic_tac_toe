require_relative 'player'

class ComputerPlayer < Player

  def get_move
    if winning_moves.length > 0
      winning_moves.sample
    elsif blocking_moves.length > 0
      blocking_moves.sample
    elsif available_moves.length == @board.count_cells
      1
    elsif fork_moves.length > 0
      fork_moves.sample
    elsif center_move
      center_move
    else
      available_moves.sample
    end
  end

  def available_moves
    @board.free_cells
  end

  def own_moves
    @board.find_cells @marker
  end

  def opponent_moves
    (1..9).to_a - (own_moves + available_moves)
  end

  def winning_moves
    check_for_wining_move own_moves
  end

  def blocking_moves
    check_for_wining_move opponent_moves
  end

  def fork_moves
    moves_still_possible = winning_moves.select do |line|
      (line - opponent_moves).length > 3
    end

    fork_move = available_moves.map do |move|
      future_moves = own_moves.dup
      future_moves << move
      (check_for_wining_move future_moves).length > 1 ? move : nil
    end.compact

    fork_move
  end

  def center_move
    5 if available_moves.include?(5)
  end

  private
  def winning_lines
    [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,9]]
  end

  def check_for_wining_move moves_made
    moves = winning_lines.map do |line|
      arr = line - moves_made
      available_moves.include?(arr.first) ? arr.first : nil if arr.length == 1
    end.compact
  end

end
