class WelcomeController < ApplicationController
  def index
    @movies = HTTParty.get("https://api.themoviedb.org/3/trending/movie/day?api_key=#{ENV['TMDB_API_KEY']}")['results']
  end
end
