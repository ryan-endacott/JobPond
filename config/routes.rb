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
  	resource :resume
  end
  #plural so we can list all

  resource :employer, only: ['show'] do
    resources :jobs, except: ['index']
    resource :dashboard, only: ['show'] do
      root :to => 'employer_dashboard#show'
    end
  end

end
