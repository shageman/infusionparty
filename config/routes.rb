Infusionparty::Application.routes.draw do
  root to: 'votes#new'
  resources :drinks
  match 'big_results', to: 'adventure_results#big_results'
  resources :votes, only: [:new, :create]
  resources :presentability_results, only: [:index]
  resources :drinkability_results, only: [:index]
  resources :adventure_results, only: [:index]
  resources :overall_results, only: [:index]
end
