class WelcomeController < ApplicationController
  before_action :get_movies, only: :index

  def index
    @movies = Rails.cache.read("movies")
  end

  private
  def get_movies
    unless Rails.cache.read("movies")
      @movies = HTTParty.get("https://api.themoviedb.org/3/trending/movie/day?api_key=#{ENV['TMDB_API_KEY']}")['results']
      Rails.cache.write("movies", @movies, :expires_in => 30.minutes)
    end
  end
end
