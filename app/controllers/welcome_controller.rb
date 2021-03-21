class WelcomeController < ApplicationController
  before_action :get_movies, only: :index

  def index
    @movies = Rails.cache.read("movies")
  end

  private
  def get_movies
    unless Rails.cache.read("movies")
      @movies = request_api('trending/movie/day')
      Rails.cache.write("movies", @movies['results'], :expires_in => 30.minutes)
    end
  end
end
