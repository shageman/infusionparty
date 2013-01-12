Infusionparty::Application.routes.draw do
  root to: 'drinks#index'
  resources :drinks
  resources :categories
end
