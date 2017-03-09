require_relative 'word_knight'

###############
# Brute Force #
###############
# We enumerate all possible moves from any given point. The most
# intuitive approach is dynamic programming, since every point has 8
# possibilities we have O(8^n) time complexity.

##########
# Future #
##########
# We can optimize the enumeration of possible moves with a simple
# heuristic, if the moves so far, don't correspond to any valid word,
# then we can stop early and stop recursing through the tree of
# possible word permutations. Since, we'd be doing many lookups in that case, we
# would want to sort the list of words. The big O is still 8*n (worst case) but
# the average runtime would be much faster.

class WordTour
  def initialize(matrix, words)
    @board = matrix # assumes square matrix
    @start_point = [0,0]
    @candidate_list = []
    @words = words
    @max_word = words.max_by(&:length)
  end

  def longest_word!
    all_candidates!
    valid_list.max
  end

  def all_candidates!
    for i in 0...@board.length do
      for j in 0...@board[0].length do
        find_candidates_at!([i, j])
      end
    end
    return @candidate_list
  end

  def find_candidates_at!(point)
    # mutates candidate_list
    traverse(WordKnight.new(@board, point, @candidate_list, @words))
    return @candidate_list
  end

  private

  def valid_list
    @candidate_list.select do |candidate|
      @words.include?(candidate)
    end
  end

  def traverse(knight)
    if knight.word.size < @max_word.size && knight.word_worthwhile?
      next_positions = knight.find_next_positions
      next_positions.each do |next_position|
        traverse(knight.dup.traverse_to(next_position))
      end
    end
  end
end

# Note: implementing the knight.word_worthwhile? heuristic saves a ridiculous
# amount of time even for a tiny grid. Below is a comparison of the two runtimes...
# With:    Finished in 0.09665 seconds (files took 0.20392 seconds to load)
# Without: Finished in 34.65 seconds (files took 0.19661 seconds to load)
