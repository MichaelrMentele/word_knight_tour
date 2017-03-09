require_relative "../lib/word_tour"
require 'rspec'

describe WordTour do
  let!(:simple_grid) do
    [
      ["a","b","c"],
      ["d","e","f"],
      ["g","h","i"]
    ]
  end

  let!(:board) do
    [
      "QWERTNUI".downcase.split(""),
      "OPAADFGH".downcase.split(""),
      "TKLZXCVB".downcase.split(""),
      "NMRWFRTY".downcase.split(""),
      "UIOPASDF".downcase.split(""),
      "GHJOLZXC".downcase.split(""),
      "VBNMQWER".downcase.split(""),
      "TYUIOPAS".downcase.split("")
    ]
  end

  describe "#find_candidates_at!" do
    it "should return all the word permutations up to the length of the passed in max word" do
      max_word = ["afg"]
      tour = WordTour.new(simple_grid, max_word) #"[a, ah, af, afg, afa, ahc, aha]"
      expect(tour.find_candidates_at!([0,0]).length).to eq(5)
    end
  end

  describe "#all_candidates!" do
    it "should return the candidates for every starting point on the grid" do
      max_word = ["1"]
      tour = WordTour.new(simple_grid, max_word) # [a, b, c, d, e, f, g, h, i]
      expect(tour.all_candidates!.length).to eq(9)
    end

    it "should return the candidates for every starting point on the grid" do
      max_word = ["123"]
      tour = WordTour.new(simple_grid, max_word) # [a, b, c, d, e, f, g, h, i]
      expect(tour.all_candidates!.length).to eq(9) # the center point has no moves
    end

    it "generates the right words" do
      words = ["algol", "fortran", "simula"]
      tour = WordTour.new(board, words)
      candidates = tour.all_candidates!
      expect(candidates.include?("fortran")).to eq(true)
    end
  end

  describe "#longest_word" do
    it "should find the longest word moving like a knight in a grid of letters" do
      words = ["algol", "fortran", "simula"]
      tour = WordTour.new(board, words)
      expect(tour.longest_word!).to eq("fortran")
    end
  end
end
