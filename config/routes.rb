Rails.application.routes.draw do


  get "/admin/index", to: "admin#index"
  
  controller :sessions do 
    get "/login" => :new 
    post "/login" => :create 
    delete "/logout" => :destroy
  end

  resources :users

end
