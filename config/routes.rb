Infusionparty::Application.routes.draw do
  resources :votes


  root to: 'drinks#index'
  resources :drinks
  resources :categories
end
