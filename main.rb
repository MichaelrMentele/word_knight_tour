require_relative 'lib/longest_word'
require_relative 'lib/shakespear_scraper'

chars_matrix = [
  "EXTRAHOP".split(""),
  "NETWORKS".split(""),
  "QIHACIQT".split(""),
  "LFUNURXB".split(""),
  "BWDILATV".split(""),
  "OSSYNACK".split(""),
  "QWOPMTCP".split(""),
  "KIPACKET".split("")
]
words = ShakespearScraper.new.generate_word_list
puts longest_word(chars_matrix, words)
