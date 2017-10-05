Rails.application.routes.draw do


  get "/admin/index", to: "admin#index"
  
  controller :sessions do 
    get "/login" => :new 
    post "/login" => :create 
    delete "/logout" => :destroy
  end

  root to: 'sessions#new'
  resources :users

  resources :corps

end
