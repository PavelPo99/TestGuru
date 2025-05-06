Rails.application.routes.draw do
  root "tests#index"

  devise_for :users, controllers: { sessions: "sessions" }, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
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

  resources :gists, only: :create

  resources :feedbacks, only: [ :new, :create ]

  namespace :admin do
    get "gists/index"

    resources :tests do
      patch :update_inline, on: :member
      delete :destroy, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
