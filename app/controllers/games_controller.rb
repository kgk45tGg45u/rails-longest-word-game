require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
    # @charset.each do |element|
    #   @b = element
    # end
  end

  def score
    @grid = params[:letters]
    @j = params[:query]
    @query_array = @j.split("")
    @query_array.each do |element|
      if @grid.include?(element)
        result = "All letters included in grid."
      end
    end
    word = params["query"]
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_serialized = URI.open(url).read
    word2 = JSON.parse(word_serialized)
    @c = word2["found"]
    if @c = true
      result = "Congratulations!"
    else
      result = "Not an English word."
    end
  end
end
