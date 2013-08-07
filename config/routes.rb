JobApp::Application.routes.draw do
  authenticated :user do
    root :to => 'marketing#employees'
  end
  root :to => 'marketing#employees'

  devise_for :users, skip: [:registrations]
  devise_for :employees, skip: [:sessions, :passwords], controllers: {registrations: 'registrations'}
  devise_for :employers, skip: [:sessions, :passwords], controllers: {registrations: 'registrations'}

  post "/avatar", to: "employees/resumes#avatar"
  namespace :employees do
  	resource :resume, only: ["edit", "update"]
    resources :applieds, only: ["create"]
  end
  resources :employees, only: ["show"]

  resources :listings, only: ["index", "show"]
  get '/employers', :to => 'marketing#employers'
  namespace :employers do
    get '/dashboard', to: 'dashboard#show', as: :dashboard
    get '/dashboard/potential_hires', to: 'potential_hires#index', as: :potential_hires
    resources :jobs, except: ['index', "show"]
  end


  #review namespace for ranking users
  namespace :admin do
    resources :reviews, only: ["index", "edit", "update"]
    resources :feedbacks, only: ['index']
    resources :stats, only: ['index']
  end

  get '/about_us', to: 'marketing#about_us'
  get '/contact', to: 'admin/feedbacks#new'
  post '/contact', to: 'admin/feedbacks#create'

  resources :charges, only: ['create']
end
