require_relative "../lib/word_knight"
require 'rspec'

describe WordKnight do
  let(:simple_board) do
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

  describe "#traverse_to" do
    it "addes the new char sequence to the candidate word list" do
      candidates = []
      knight = WordKnight.new(simple_board, [0,0], candidates)
      knight.traverse_to([2,1])
      expect(candidates[0]).to eq("Q")
      expect(candidates[1]).to eq("QK")
    end
  end

  describe "#find_next_positions" do
    it "should count the appropriate number of moves in a corner" do
      knight = WordKnight.new(simple_board, [0,0], [])
      expect(knight.find_next_positions.length).to eq(2)
    end

    it "should count the appropriate number of moves from an edge" do
      knight = WordKnight.new(simple_board, [0, 2], [])
      expect(knight.find_next_positions.length).to eq(4)
    end

    it "should count the appropriate number of moves from the middle" do
      knight = WordKnight.new(simple_board, [4,4], [])
      expect(knight.find_next_positions.length).to eq(8)
    end
  end
end
