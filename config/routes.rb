Rails.application.routes.draw do

  devise_scope :guest do
    get '/admin', to: "users/sessions#new"
  end
  devise_for :users,
             controllers: {
               sessions: 'users/sessions'
             }

  resources :users, :samples, :events

  resources :documents, except: :new

  get "/admin/dashboard", to: 'admin/dashboard#show', as: :admin_dashboard
  get "/dashboard", to: 'guest/dashboard#show', as: :guest_dashboard

  get "/simple", to: 'home#simple_cal'
  get "/ical", to: 'home#i_cal'
  get "/full", to: 'home#full_cal'
  get "/home", to: 'home#show'
  root 'home#show'
end
