require_relative "../lib/longest_word"
require 'rspec'

# Unit Tests
describe "#possible_moves_from_point" do
  it "should count the appropriate number of moves in a corner" do
    expect(possible_moves_from_point([0, 0]).length).to eq(2)
  end

  it "should count the appropriate number of moves from an edge" do
    expect(possible_moves_from_point([0, 2]).length).to eq(4)
  end

  it "should count the appropriate number of moves from the middle" do
    expect(possible_moves_from_point([4,4]).length).to eq(8)
  end
end

describe "#enumerate_words" do
  let(:simple_grid) do
    [
      ["a","b","c"],
      ["d","e","f"],
      ["g","h","i"]
    ]
  end

  it "should return the appropriate number of word permutations for a given max_word_size" do
    words = []
    max_word_size = 3
    enumerate_words([0,0], "", simple_grid, words, max_word_size)
    #"[a, ah, af, afg, afa, ahc, aha]"
    puts words
    expect(words.size).to eq(7)
  end
end

describe "finding the longest word" do
  let(:matrix) do
    [
      "QWERTYNUI".split(""),
      "OPAADFGH".split(""),
      "TKLZXCVB".split(""),
      "NMRWFRTY".split(""),
      "UIOPASDF".split(""),
      "GHJOLZXC".split(""),
      "VBNMQWER".split(""),
      "TYUIOPAS".split("")
    ]
  end
  it "should find the longest word moving like a knight in a grid of letters" do
    words = ["algol", "fortran", "simula"]
    expect(longest_word(matrix, words)).to eq("fortran")
  end
end
