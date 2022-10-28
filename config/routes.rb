Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "arena_actions#index"
  post "arena" => "arena_actions#arena"
end
