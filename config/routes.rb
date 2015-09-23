Rails.application.routes.draw do
  resources :recipes
  get 'vegetables' => 'recipes#vegetables'
  get 'poultry' => 'recipes#poultry'
  get 'meat' => 'recipes#meat'
  get 'seafood' => 'recipes#seafood'
  get 'appetizers' => 'recipes#appetizers'

  devise_for :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
