Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"

  get '/movie/:id', to: 'movie#show', as: 'movie_show'
  get '/movie/:id/status', to: 'movie#is_user_movie_present', as: 'is_user_movie_present'
  post '/movie/:id', to: 'movie#add_favorite', as: 'movie_favorite_check'
end
