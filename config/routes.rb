Rails.application.routes.draw do

  root 'pictures#index'
  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id' => 'pictures#show'

  get 'pictures/:id/edit' => "pictures#edit", :as => "picture"
  patch 'pictures/:id' => "pictures#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete 'pictures/:id' => 'pictures#destroy'

  post 'users' => 'users#create'
  get 'users/new' => 'users#new'

  post 'sessions' => 'sessions#create'
  get 'sessions/new' => 'sessions#new', :as => "new_sessions"

  delete 'sessions' => 'sessions#destroy'

end
