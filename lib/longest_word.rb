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
def longest_word(matrix, words)
  max_word_size = words.max.length
  starting_point = [0, 0]   # initial coordinates
  starting_word = matrix[0][0]       # starting point

  potential_words = []
  enumerate_words(starting_point, starting_word, matrix, potential_words, max_word_size)

  require 'pry'; binding.pry
  # save each sequence and sub sequence of possible moves, stopping
  # when a given sequence would be greater than the longest word in words

  # sort the sequence of potential_words by length

  # starting from the longest potential_word, check if it is in the list
  # of words, if it is, we are done, return that word.
end

def enumerate_words(point, potential_word, chars_matrix, potential_words, max_word_size)
  return if potential_word.length > max_word_size

  potential_words << potential_word

  # find all valid possible moves from current point
  next_moves = possible_moves_from_point(point, 0, chars_matrix.size - 1)

  # iterate through each move
  i = 0
  while i < next_moves.length do
    move = next_moves[i]
    r, c = move[0], move[1]
    puts "---"
    puts "[#{r}], [#{c}]"
    potential_word = potential_word + chars_matrix[r][c]
    enumerate_words(move, potential_word, chars_matrix, potential_words, max_word_size)

    i += 1
  end
end

def possible_moves_from_point(point, min=0, max=7)
  r, c = point[0], point[1]

  # Where movement is like that of a knight from chess,
  # permutations of (i +- 1 union j +- 2) and (i +- 2 union j +- 1)
  possible_moves = []

  # Vertical moves
  possible_moves << [r + 2, c + 1]
  possible_moves << [r + 2, c - 1]
  possible_moves << [r - 2, c + 1]
  possible_moves << [r - 2, c - 1]

  # Horizontal moves
  possible_moves << [r + 1, c + 2]
  possible_moves << [r + 1, c - 2]
  possible_moves << [r - 1, c + 2]
  possible_moves << [r - 1, c - 2]

  remove_out_of_bounds(possible_moves, min, max)
end

def remove_out_of_bounds(moves, min, max)
  return moves.select do |coordinate|
    r = coordinate[0]
    c = coordinate[1]
    (r >= min && r <= max) && (c >= min && c <= max)
  end
end
