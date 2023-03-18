# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  scope :api, defaults: { format: :json } do
    devise_for :users,
               controllers: {
                 sessions: "users/sessions",
                 registrations: "users/registrations",
               }
    get "/status/ok", to: "status#ok"
    get "/status/user", to: "status#user"
    get "/status/admin", to: "status#admin"
  end

  root "react#index"
  get "*path", to: "react#index"
end
