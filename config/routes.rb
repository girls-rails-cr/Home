Rails.application.routes.draw do

  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  devise_for :users, :sign_out_via => [ :get, :delete ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  namespace :admin do
    resources :subscribers
    put 'update_registered/:id', to: 'subscribers#update_registered', as: :update_registered
    put 'update_confirmed/:id', to: 'subscribers#update_confirmed', as: :update_confirmed
    put 'second_update_confirmed/:id', to: 'subscribers#second_update_confirmed', as: :second_update_confirmed
    post 'update_details/:id', to: 'subscribers#update_details', as: :update_details
    get 'export_csv', to: 'subscribers#export_csv', as: :export_csv


    resources :sponsors
    resources :voluntaries
    resources :admins,  only: [:index, :edit, :update, :destroy, :new]
    resources :events
    resources :users

    resource :profile, only: [:update, :edit, :destroy] do
      member do
        delete :destroy_avatar
      end
    end
    get '/events', to: 'events#index'
    get 'profile', to: 'profiles#edit'
    root to: 'dashboards#index', as: 'root'
  end

  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
