Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'teams#index'

  get 'team_form', to: 'teams#form'
  resources :teams do
    resources :players
  end
end
