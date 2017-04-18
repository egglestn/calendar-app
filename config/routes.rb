Rails.application.routes.draw do

  devise_scope :guest do
    get '/admin', to: "users/sessions#new"
  end
  devise_for :users,
             controllers: {
               sessions: 'users/sessions'
             }

  resources :users, :samples

  resources :documents, except: :new

  get "/admin/dashboard", to: 'admin/dashboard#show', as: :admin_dashboard
  get "/dashboard", to: 'guest/dashboard#show', as: :guest_dashboard

  get "/simple", to: 'home#simple_cal'
  root 'home#show'
end
