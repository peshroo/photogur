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

end
