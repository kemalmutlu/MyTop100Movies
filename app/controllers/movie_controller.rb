class MovieController < ApplicationController
  before_action :get_movie, only: :show
  before_action :is_movie_present, only: :add_favorite

  def show
    @movie = Rails.cache.read("movie_#{params[:id]}")
  end

  def add_favorite
    if current_user.present? && @favorite_movie.nil?
      @favorite_movie = FavoriteMovie.create(movie: params[:id], user_id: current_user.id)

      if @favorite_movie.save
        message = {status: 'added'}
        render json: message
      end
   end
  end

  def is_user_movie_present
    @favorite_movie = FavoriteMovie.where(movie: params[:id], user_id: current_user.id).first
    if @favorite_movie.present?
      message = {status: 'present'}
      render json:  message
    else
      message = {status: 'not_present'}
      render json:  message
    end
  end

  private
  def is_movie_present
    @favorite_movie = FavoriteMovie.where(movie: params[:id], user_id: current_user.id).first
    if current_user.present? && @favorite_movie.present?
      if @favorite_movie.destroy
        message = {status: 'deleted'}
        render json: message
      end
    end
  end

  def get_movie
    unless Rails.cache.read("movie_#{params[:id]}")
      @movie = request_api("movie/#{params[:id]}")
      Rails.cache.write("movie_#{params[:id]}", @movie, :expires_in => 60.minutes)
    end
  end
end
