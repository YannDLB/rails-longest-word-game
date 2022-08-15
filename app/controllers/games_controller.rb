require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @ing = false
    lettertest = params[:letters]
    params[:try].chars.each do |letter|
      if lettertest.count(letter)
        lettertest.delete!(letter)
        @ing = true
      end
    end
    @letters = params[:letters]
    @found = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{params[:try]}").read)["found"]
  end
end
