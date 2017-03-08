require 'nokogiri'
require 'open-uri'

class ShakespeareScraper
  # scrapes and generates a word list
  def initialize(url="http://shakespeare.mit.edu/lll/full.html")
    @url = url
    @doc = Nokogiri::HTML(open(url))
  end

  def generate_word_list
    words = formatted_lines.map { |line| line.split(" ") }
    return words.flatten!
  end

  private

  def formatted_lines
    raw_lines.map { |line| line.downcase.gsub(/[^a-z0-9\s]/i, '') }
  end

  def raw_lines
    @doc.css("blockquote a").map(&:text)
  end
end

require 'pry'; binding.pry
