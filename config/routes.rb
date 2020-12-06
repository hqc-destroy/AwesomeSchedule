Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  root "tasks#index"
  post '/task/date', to:'oneday#show'
  devise_for :users
  resources :tasks
end
