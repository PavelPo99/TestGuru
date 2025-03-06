Rails.application.routes.draw do

  namespace :admin do
    get 'gists/index'
    get 'gists/show'
  end
  root 'tests#index'
  
  devise_for :users, controllers: { sessions: 'sessions' }, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
      member do
      post :start
    end
  end

  # GET /test_passage/2/result
  resources :test_passages, only: %i[ show update ] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: [:index, :show] 
    resources :tests do
      resources :questions, shallow: true, except: :index do 
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
