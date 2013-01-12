Infusionparty::Application.routes.draw do
  root to: 'votes#new'
  resources :drinks
  resources :categories
  resources :votes
end
