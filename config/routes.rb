JobApp::Application.routes.draw do
  authenticated :user do
    root :to => 'marketing#employees'
  end
  root :to => 'marketing#employees'

  devise_for :users, skip: [:registrations]
  devise_for :employees, skip: [:sessions, :passwords], controllers: {registrations: 'registrations'}
  devise_for :employers, skip: [:sessions, :passwords], controllers: {registrations: 'registrations'}

  resource :employee do
  	resource :resume, only: ["edit", "update"]
  end
  get  '/listings',  :to => 'listings#index'
  namespace :employers do
    get "/", to: 'marketing#employers'
    get "/dashboard", to: 'dashboard#show', as: :dashboard
    resources :jobs, except: ['index']
  end

end
