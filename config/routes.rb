Rails.application.routes.draw do
  devise_for :users
  get 'comments/index'

  get 'comments/create'

  get 'comments/show'

  get 'comments/edit'

  get 'comments/new'

  resources :recipes do
    resources :comments, only: [:create, :show, :index, :new, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  get 'vegetables' => 'recipes#index', :category => "vegetables"
  get 'poultry' => 'recipes#index', :category => "poultry"
  get 'meat' => 'recipes#index', :category => "meat"
  get 'seafood' => 'recipes#index', :category => "seafood"
  get 'appetizers' => 'recipes#index', :category => "appetizers"


  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
