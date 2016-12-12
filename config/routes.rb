Rails.application.routes.draw do

  devise_scope :user do
    get '/admin', to: "users/sessions#new"
  end
  devise_for :users,
             controllers: {
               sessions: 'users/sessions'
             }

  resources :users

  resources :documents, except: :new

  resources :rooms, only: [] do
    resources :finishes
  end

  resources :developments do
    resources :phases
    resources :unit_types
    resources :rooms
    resources :plots
  end

  resources :developers do
    resources :divisions
    resources :developments, controller: 'developers/developments'
  end

  resources :divisions do
    resources :developments, controller: 'divisions/developments'
  end

  get "/admin/dashboard", to: 'admin/dashboard#show', as: :admin_dashboard
  get "/dashboard", to: 'homeowner/dashboard#show', as: :homeowner_dashboard
  root 'home#show'
end
