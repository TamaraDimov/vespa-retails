Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

 namespace :api do
  namespace :v1 do
    resources :motorcycle
    # resources :users, only: %i[index create destroy]
    # post 'login', to: 'authentication#create'
    # post 'register', to: 'users#create'
  end
 end
end
