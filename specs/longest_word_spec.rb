require_relative "../lib/longest_word"

# Unit Tests
puts "#{possible_moves_from_point([0, 0])} represents two moves"
puts possible_moves_from_point([0, 0]).length == 2

puts "#{possible_moves_from_point([4,4])} represents eight moves"
puts possible_moves_from_point([4,4]).length == 8

puts "#{possible_moves_from_point([0, 0], 0, 2)} represents two moves"
puts possible_moves_from_point([0, 0], 0, 2).length == 2

simple_grid = [
  ["a","b","c"],
  ["d","e","f"],
  ["g","h","i"]
]

words = []
max_word_size = 3
enumerate_words([0,0], "a", simple_grid, words, max_word_size)
puts "#{words} should be"
puts "[a, ah, af, afg, afa, ahc, aha]"
puts words.size == 7

# Integration Test
chars = [
  "QWERTYNUI".split(""),
  "OPAADFGH".split(""),
  "TKLZXCVB".split(""),
  "NMRWFRTY".split(""),
  "UIOPASDF".split(""),
  "GHJOLZXC".split(""),
  "VBNMQWER".split(""),
  "TYUIOPAS".split("")
]

words = ["algol", "fortran", "simula"]
#puts "The longest word is 'fortran'"
#puts longest_word(chars, words) == "fortran"
