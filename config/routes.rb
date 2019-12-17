Rails.application.routes.draw do
  resources :dogs, only:[:index, :show]



  resources :employees, only:[:index, :show, :create, :new, :edit, :update]


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
