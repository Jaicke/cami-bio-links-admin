Rails.application.routes.draw do
  devise_for :users
  authenticate :user do
    mount Avo::Engine, at: Avo.configuration.root_path
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :links, only: :index
    end
  end

  # Defines the root path route ("/")
  root to: redirect('/admin')
end
