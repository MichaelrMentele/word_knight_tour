class WordKnight
  LEGAL_STEPS = [
    [-2,  1], [-1,  2], [ 1,  2], [ 2,  1],
    [ 2, -1], [ 1, -2], [-1, -2], [-2, -1]
  ]

  attr_reader :board, :steps_taken

  def initialize(board, start_at, candidate_list)
    @board = board
    @candidate_list_ref = [] # passed in array reference
    @word = ""
    traverse_to(start_at)
  end

  def traverse_to(new_position)
    @current_position = new_position
    @word += @board[@current_position[0]][@current_position[1]]
    @candidate_list_ref << @word
    self
  end

  def find_next_positions
    positions = LEGAL_STEPS.map do |step|
      position_after_step(@current_position, step)
    end
    positions.reject { |pos| !is_safe?(pos[0], pos[1]) }
  end

  private

  def position_after_step(from, step)
    x_pos = from[0] + step[0]
    y_pos = from[1] + step[1]
    [x_pos, y_pos]
  end

  def is_safe?(x, y)
    return (x >= 0 && x < @board.size && y >= 0 && y < @board[0].size)
  end
end
