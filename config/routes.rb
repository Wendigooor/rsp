Rails.application.routes.draw do
  resources :games, only: %i[index create]

  root to: 'games#index'
end
