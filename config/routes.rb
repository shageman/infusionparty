Infusionparty::Application.routes.draw do
  root to: 'votes#new'
  resources :drinks
  resources :votes, only: [:new, :create]
  resources :results, only: [:index]
end
