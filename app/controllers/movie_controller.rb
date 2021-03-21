class MovieController < ApplicationController
  before_action :get_movie, only: :show

  def show
    @movie = Rails.cache.read("movie_#{params[:id]}")
  end

  private
  def get_movie
    unless Rails.cache.read("movie_#{params[:id]}")
      @movie = request_api("movie/#{params[:id]}")
      Rails.cache.write("movie_#{params[:id]}", @movie, :expires_in => 60.minutes)
    end
  end
end
