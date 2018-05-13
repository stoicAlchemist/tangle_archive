Rails.application.routes.draw do
  resources :users
  resources :project_types
  resources :comments # This needs to be first so the others can use it

  resources :projects
  resources :efforts
  resources :statuses

  concern :commentable do
    resources :comments
  end

  resources :tasks, concerns: :commentable
  resources :domains, concerns: :commentable
  get '/', to: "landing#index", as: 'root'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
