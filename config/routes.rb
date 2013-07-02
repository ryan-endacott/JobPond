JobApp::Application.routes.draw do
  authenticated :user do
    root :to => 'employees#index'
  end
  root :to => "employees#index"
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

  get '/employers', to: 'Employers#index'
  get '/employers/dashboard', to: 'EmployerDashboard#show'

end
