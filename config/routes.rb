Infusionparty::Application.routes.draw do
  root to: 'votes#new'
  resources :drinks
  resources :votes
end
