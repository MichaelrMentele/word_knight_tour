class WordKnight
  LEGAL_STEPS = [
    [-2,  1], [-1,  2], [ 1,  2], [ 2,  1],
    [ 2, -1], [ 1, -2], [-1, -2], [-2, -1]
  ]

  attr_reader :board, :steps_taken, :word

  def initialize(board, start_at, candidate_list, valid_words)
    @board = board
    @candidate_list = candidate_list # passed in array reference
    @valid_words = valid_words
    @word = ""
    traverse_to(start_at)
  end

  def traverse_to(new_position)
    @current_position = new_position
    @word += @board[@current_position[0]][@current_position[1]]
    @candidate_list << @word
    self
  end

  def find_next_positions
    positions = LEGAL_STEPS.map do |step|
      position_after_step(@current_position, step)
    end
    positions.reject { |pos| !is_safe?(pos[0], pos[1]) }
  end

  def word_worthwhile?
    ##########
    # Future #
    ##########
    # We can improve the speed of the program by improving the speed of this search.
    # For words of length m, we perform m * number_of_permutations. Therefore,
    # we want to reduce this method from O(m) to O(log(n)). We can do this by sorting
    # the list and the using binary search.
    @word
    # check every valid word, see if @word is a subset of any of them
    # if it is, it's worth continuing because it might be the longest word
    worthwhile_flag = false
    @valid_words.each do |valid_word|
      if valid_word.include?(@word)
        worthwhile_flag = true
        break
      end
    end
    return worthwhile_flag
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
