require_relative 'lib/word_tour'
require_relative 'lib/shakespeare_scraper'

board = [
  "EXTRAHOP".downcase.split(""),
  "NETWORKS".downcase.split(""),
  "QIHACIQT".downcase.split(""),
  "LFUNURXB".downcase.split(""),
  "BWDILATV".downcase.split(""),
  "OSSYNACK".downcase.split(""),
  "QWOPMTCP".downcase.split(""),
  "KIPACKET".downcase.split("")
]
puts "Scraping Shakespeare text and generating word list..."
words = ShakespeareScraper.new.generate_word_list
require 'pry'; binding.pry
puts "Finding all valid possible words..."
puts WordTour.new(board, words).longest_word!

#################################
# Clarification of Requirements #
#################################

# Output the longest word from words that can be found in the matrix
# following these rules:
# => From a starting point, select a valid position in the grid moving
# => in the same way a knight in chess would ie. from any i, j position
# => move to i +- 1 AND j +- 2 OR i +- 2 AND j +- 1. You can move
# => without limit and allowing the same grid position to be reused!
