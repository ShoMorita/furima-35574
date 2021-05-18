Rails.application.routes.draw do
  root to: "furimas#index"
  resources :resources
end
