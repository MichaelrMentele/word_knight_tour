#################################
# Clarification of Requirements #
#################################

# Output the longest word from words that can be found in the matrix
# following these rules:
# => From a starting point, select a valid position in the grid moving
# => in the same way a knight in chess would ie. from any i, j position
# => move to i +- 1 AND j +- 2 OR i +- 2 AND j +- 1. You can move
# => without limit and allowing the same grid position to be reused!

############
# Approach #
############

# We are going to need to search the list of words often to eliminate
# possibilities. It would be worth the initial O(n) cost to sort the
# list in some way.

###############
# Brute Force #
###############
# We can enumerate all possible moves from any given point but we
# need to be careful not to get stuck in an infinite loop. As we
# test every branch, we delete those that have more characters
# then the longest word, or even better, when they no longer match
# any words. Since every point has 8 possibilities we have O(8^n)
# time complexity.

# My hunch is we want to use some form of dynamic programming, or
# recursion with memoization.
class WordTour

  def intialize(matrix)
    @board = matrix # assumes square matrix
    @start_point = [0,0]
    @candidate_list = []
  end

  def solve
    traverse(WordKnight.new(@board, @start_point, @candidate_list))
    return @list
  end

  def traverse(knight)
    unless knight.word.size > max_word.size
      next_positions = knight.find_next_positions
      next_positions.each do |next_position|
        traverse(knight.traverse_to(next_position))
      end
    end
  end
end
