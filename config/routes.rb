Rails.application.routes.draw do


  get "/admin/index", to: "admin#index"
  
  controller :sessions do 
    get "/login" => :new 
    post "/login" => :create 
    delete "/logout" => :destroy
  end

  root to: 'sessions#new'
  resources :users do
    member do
      get 'workfor'
      get 'new_workfor'
      post 'create_workfor'
    end
    resources :jobs
  end

  get '/work/:id', to: 'users#work', as: 'workfor'
  resources :corps

end
