Rails.application.routes.draw do
  resources :subscribers , only: [:create]

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  namespace :admin do
    root to: 'dashboards#index', as: 'root'
    put 'update_registered/:id', to: 'dashboards#update_registered', as: :update_registered
    put 'update_confirmed/:id', to: 'dashboards#update_confirmed', as: :update_confirmed
  end

  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
