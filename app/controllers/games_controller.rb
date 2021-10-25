require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @score = 0
    dictionary_api_url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    word = JSON.parse(URI.open(dictionary_api_url).read)
    if word['found'] == true && !params[:answer].nil?
      if params[:answer].chars.all? {|letter| params[:answer].count(letter) <= params[:grid].count(letter)}
        @output = "Congratulations! #{params[:answer].upcase} is a valid English Word!"
        session[:score] += params[:answer].length * 2
        @score += session[:score]
      else
        @output = "Sorry but #{params[:answer].upcase} can't be built from #{params[:grid].upcase}"
      end
    else
      @output = "Sorry but #{params[:answer].upcase} is not an English Word"
    end
  end
end
