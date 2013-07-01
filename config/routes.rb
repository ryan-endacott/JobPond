JobApp::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  #resources :users
  #left the above for default although users probably needs to be singular
  #users might not be needed at all since we have subclasses

  resource :employee do
  	resource :resume, except: ["new"]
  end
  #plural so we can list all

  resource :employer, only: ['show'] do
    resource :dashboard, only: ['show'] do
      root :to => 'employer_dashboard#show'
    end
  end

  #cant use the jobs controller.  Need different layout and features.
  resources :jobs, controller: :listings, only: ["index", "show"]

end
