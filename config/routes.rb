Rails.application.routes.draw do 
  
  resources :projects do
    resources :tickets
  end
  root to: "projects#index"
end
