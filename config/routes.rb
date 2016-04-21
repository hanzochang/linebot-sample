Rails.application.routes.draw do
  post '/callback' => 'root#callback'
end
