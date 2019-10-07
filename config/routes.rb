Rails.application.routes.draw do
  resources :polygons, only: [:index]
  
  resources :points, only: [] do
    post 'check', on: :collection
  end
end
