Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :articles
  resources :users
  get 'users/:id/articles' => 'users#articles', :as => :user_articles

end
