class ApplicationController < ActionController::Base

  def request_api(params)
    HTTParty.get("https://api.themoviedb.org/3/#{params}?api_key=#{ENV['TMDB_API_KEY']}")
  end
end
