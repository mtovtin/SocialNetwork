Rails.application.routes.draw do
  resources :follows
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :tweets
  devise_scope :user do
  post '/users/:id/follow', to: "registrations#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "registrations#unfollow", as: "unfollow_user"
  end
  root 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
