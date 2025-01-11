Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  authenticate :user do
    resources :file_records, only: [:index, :new, :create, :destroy] do
      member do
        post :share
      end
    end
  end

  get 'public/:token', to: 'file_records#public_show', as: 'public_file'

  root to: "file_records#index"
end
