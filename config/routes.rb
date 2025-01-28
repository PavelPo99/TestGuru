Rails.application.routes.draw do
  get 'answers/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'tests#index'
  
  resources :tests, shallow: true do
    resources :questions do
      resources :answers, only: :index
    end
  end
end
