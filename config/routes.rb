Rails.application.routes.draw do
  get "/sign_up", to: "demo_screen#sign_up"
  get "/sign_in", to: "demo_screen#sign_in"
end