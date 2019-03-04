Rails.application.routes.draw do
  resources :ideas do
    resources :reviews, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
  get("/", to: "ideas#index", as: :root)
end
