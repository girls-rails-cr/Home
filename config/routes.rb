Rails.application.routes.draw do
  resources :subscribers , only: [:create]

  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  devise_for :users, :sign_out_via => [ :get, :delete ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  namespace :admin do
    root to: 'dashboards#index', as: 'root'
    put 'update_registered/:id', to: 'dashboards#update_registered', as: :update_registered
    put 'update_confirmed/:id', to: 'dashboards#update_confirmed', as: :update_confirmed
    put 'second_update_confirmed/:id', to: 'dashboards#second_update_confirmed', as: :second_update_confirmed
    post 'update_details/:id', to: 'dashboards#update_details', as: :update_details
    get 'export_csv', to: 'dashboards#export_csv', as: :export_csv

    resource :profile, only: [:update, :edit, :destroy] do
      member do
        delete :destroy_avatar
      end
    end
    get 'profile', to: 'profiles#edit'
  end

  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
