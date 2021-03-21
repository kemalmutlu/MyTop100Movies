Rails.application.routes.draw do
  root to: "welcome#index"

  get '/movie/:id', to: 'movie#show', as: 'movie_show'
end
