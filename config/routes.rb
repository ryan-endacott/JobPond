JobApp::Application.routes.draw do
  authenticated :user do
    root :to => 'marketing#employees'
  end
  root :to => 'marketing#employees'
  devise_for :users#, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get "employee/new", to: "devise/registrations#new"
    get "employer/new", to: "devise/registrations#new"
    root to: "marketing#employees"
  end
  #resources :users
  #left the above for default although users probably needs to be singular
  #users might not be needed at all since we have subclasses

  resource :employee do
  	resource :resume, only: ["create", "edit", "update"]
  end
  #plural so we can list all

  namespace :employer do
    get "/", to: 'marketing#employers'
    get "/dashboard", to: 'dashboard#show', as: :dashboard
    resources :jobs, except: ['index']
  end

end
