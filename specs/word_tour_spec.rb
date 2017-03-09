require_relative "../lib/word_tour"
require 'rspec'

describe WordTour do
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
