Rails.application.routes.draw do
  devise_for :users
  get "/sign_up", to: "demo_screen#sign_up"
  get "/sign_in", to: "demo_screen#sign_in"
end