Rails.application.routes.draw do
  resources :ideas
  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
  get("/", to: "ideas#index", as: :root)
end
