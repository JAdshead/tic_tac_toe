class Board
  attr_reader :grid

  def initialize( rows = 3, columns = 3, default_value = ' ' )
    @grid          = new_grid(rows, columns, default_value)
    @default_value = default_value
    @rows          = rows
    @columns       = columns
  end

  def set_cell(cell_num, value)
    row, column = human_to_grid(cell_num)
    if @grid[row][column] == @default_value
      @grid[row][column] = value
    else
      false
    end
  end

  def get_cell(cell_num)
    row, column = human_to_grid(cell_num)
    return @grid[row][column]
  end

  def get_diagonals
    rows = @rows - 1
    left_to_right = (0..rows).map {|i| @grid[i][i] }
    right_to_left = (0..rows).map {|i| @grid[i][rows - i] }
    return [left_to_right, right_to_left]
  end

  def get_columns
    @grid.transpose
  end

  def get_rows
    @grid
  end


  # this should probably be private
  def human_to_grid(cell_num)
    # ensure cell_num is int & zero base the number
    cell_num = cell_num.to_i
    cell_num -= 1

    # divide the cell_num by the number of rows to get the row
    row = cell_num / @rows

    # take the number of cells on lower rows from the cell number
    # to get column number
    column = cell_num - (row * @columns)

    return [row, column]
  end

  def print
    to_print = @grid.dup
    puts
    while to_print.length > 1 do
      row = to_print.shift
      puts row.flatten.join(' | ')
      puts '---------'
    end
    row = to_print.shift
    puts row.flatten.join(' | ')
    puts
  end

  private

  def new_grid(rows, columns, cell_value)
    Array.new(rows) { Array.new(columns, cell_value) }
  end

end
