Rails.application.routes.draw do
  devise_for :users
  root 'places#index'  
  resources :places do
    resources :comments, only: :create # adding comment route to be nested underneath the place, by doing this, the IRL for it will contain the place_id
    resources :photos, only: :create
  end

end
