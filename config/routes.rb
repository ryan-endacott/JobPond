JobApp::Application.routes.draw do
  authenticated :user do
    root :to => 'marketing#employees'
  end
  root :to => 'marketing#employees'
  devise_for :users
  #resources :users
  #left the above for default although users probably needs to be singular
  #users might not be needed at all since we have subclasses

  resource :employee do
  	resource :resume, only: ["create", "edit", "update"]
  end
  #plural so we can list all

  resource :employer, only: [] do
    resources :jobs, except: ['index']
  end

  get '/employers', to: 'marketing#employers'
  get '/employers/dashboard', to: 'EmployerDashboard#show', as: :employer_dashboard

end
