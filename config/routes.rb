Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"

  get '/movie/:id', to: 'movie#show', as: 'movie_show'
end
