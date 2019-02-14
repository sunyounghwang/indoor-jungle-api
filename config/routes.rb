Rails.application.routes.draw do
  namespace :api do
    resources :plants, except: [:new, :edit]
  end
end
