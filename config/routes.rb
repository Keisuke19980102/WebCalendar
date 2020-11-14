Rails.application.routes.draw do
  get "/events/:event_id/edit" => "events#edit"
  post "/events/:event_id/update" => "events#update"
  get "/events/:event_id/detail" => "events#detail"
  get "/events/:year/:month/:aday/new" => "events#new"
  post "/events/:year/:month/:aday/create" => "events#create"
  get "/events/:year/:month/:aday" => "events#show"
  get "/events/:year/:month" => "events#index"
  get '/' => "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
