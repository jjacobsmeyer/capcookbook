Rails.application.routes.draw do


  devise_for :users
  resources :users, only: :show
  get 'comments/index'

  get 'comments/create'

  get 'comments/show'

  get 'comments/edit'

  get 'comments/new'

  resources :recipes do
    resources :comments, only: [:create, :show, :index, :new, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  get 'drinks' => 'recipes#index', :category => "drinks"
  get 'entrees' => 'recipes#index', :category => "entrees"
  get 'sides' => 'recipes#index', :category => "sides"
  get 'desserts' => 'recipes#index', :category => "desserts"
  get 'appetizers' => 'recipes#index', :category => "appetizers"


  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
