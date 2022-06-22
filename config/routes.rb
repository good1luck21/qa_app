Rails.application.routes.draw do
  root 'questions#index'
  get 'questions/new'
  get 'questions/:id',to: 'questions#show', as: 'show'
  post 'questions/create', to: 'questions#create', as: 'question_create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
