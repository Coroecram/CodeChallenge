Rails.application.routes.draw do
  resources :events, :people, :invitations
end
