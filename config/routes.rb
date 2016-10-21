Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "currency#index"

  get '/admin', to: 'currency#admin'
  post 'currency', to: 'currency#create'
end
