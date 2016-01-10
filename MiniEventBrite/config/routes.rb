Rails.application.routes.draw do
  root 'events#index'
  resources :events, :people, :invitations
end
