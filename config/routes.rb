Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "zipcodes#index"

  resources :districts, only: [:index, :show] do
    resources :candidates do
      resources :votes, only: [:create, :new]
    end
  end

  resources :senates, only: [:index, :show] do
    resources :scandidates do
      resources :svotes, only: [:create, :new]
    end
  end

  resources :houses, only: [:index, :show] do
    resources :hcandidates do
      resources :hvotes, only: [:create, :new]
    end
  end

  resources :candidates do
    resources :votes, only: [:create, :new]
  end

  resources :scandidates do
    resources :svotes, only: [:create, :new]
  end

  resources :hcandidates do
    resources :hvotes, only: [:create, :new]
  end

  resources :users, only: [:show]

  get "zipcodes" => "zipcodes#index"
  get "zipcodes/:zip" => "zipcodes#show"
  post "zipcodes" => "zipcodes#create"


end
