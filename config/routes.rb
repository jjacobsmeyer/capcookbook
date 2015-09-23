Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/create'

  get 'comments/show'

  get 'comments/edit'

  get 'comments/new'

  resources :recipes do
    resources :comments, only: [:create, :show, :index, :new, :destroy]
  end
  get 'vegetables' => 'recipes#vegetables'
  get 'poultry' => 'recipes#poultry'
  get 'meat' => 'recipes#meat'
  get 'seafood' => 'recipes#seafood'
  get 'appetizers' => 'recipes#appetizers'

  devise_for :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
