require_relative 'player'

module TicTacToe
  class ComputerPlayer < Player

    def move
      move = win || block || fork_move || force_block || block_fork
      return move if move

      if available_moves.size == board.count_cells
        1
      else
        go_center || available_moves.sample
      end
    end

    def available_moves
      board.free_cells
    end

    def own_moves
      board.find_cells(marker)
    end

    def opponent_moves
      (1..9).to_a - (own_moves + available_moves)
    end

    def win
      check_wining_moves(own_moves).sample
    end

    def block
      check_wining_moves(opponent_moves).sample
    end

    def force_block
      winning_lines.map do |line|
        next unless (line & opponent_moves).empty? && (line & own_moves).any?

        moves = line - own_moves

        moves.map do |move|
          forced_move = (line - (own_moves << move)).first
          opponent_future_moves = opponent_moves << forced_move
          check_wining_moves(opponent_future_moves).size < 2 ? move : nil
        end
      end.flatten.compact.sample
    end

    def fork_move
      check_fork_moves(own_moves).sample
    end

    def block_fork
      check_fork_moves(opponent_moves).sample
    end

    def go_center
      5 if available_moves.include?(5)
    end

    private

    def winning_lines
      [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    end

    # def lines_still_possible
    #   winning_lines.select do |line|
    #     (line - opponent_moves).size > 3
    #   end
    # end

    def check_wining_moves(moves_made)
      winning_lines.map do |line|
        arr = line - moves_made

        next unless arr.size == 1

        available_moves.include?(arr.first) ? arr.first : nil
      end.compact
    end

    def check_fork_moves(moves_made, moves_left = available_moves)
      moves_left.map do |move|
        future_moves = moves_made.dup

        future_moves << move

        (check_wining_moves future_moves).size > 1 ? move : nil
      end.compact
    end
  end
end
