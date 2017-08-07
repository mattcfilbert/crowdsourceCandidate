Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "districts#index"

  resources :districts, only: [:index, :show] do
    resources :candidates do
      resources :votes, only: [:create, :new]
    end
  end

  resources :candidates do
    resources :votes, only: [:create, :new]
  end
end
