Rails.application.routes.draw do

  
  root 'tests#index'

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  get :signup, to: 'users#new'
  post :signup, to: 'users#create'


  resources :tests do
    resources :questions, shallow: true, except: :index do 
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  # GET /test_passage/2/result
  resources :test_passages, only: %i[ show update ] do
    member do
      get :result
    end
  end
end
