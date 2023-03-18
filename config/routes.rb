# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/status/ok", to: "status#ok"
  get "/status/user", to: "status#user"
  get "/status/admin", to: "status#admin"

  # Defines the root path route ("/")
  root "react#index"
end
