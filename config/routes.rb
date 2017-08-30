Rails.application.routes.draw do
  resources :subscribers, only: [:create]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  namespace :admin do
    root to: 'dashboards#index', as: 'root'
  end

  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end
end
