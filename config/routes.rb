Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  get "/pages/:page" => "pages#show"
end
