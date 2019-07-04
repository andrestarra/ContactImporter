Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'

  resources :contacts_files do
    resources :field_columns
    get 'proccess'
  end
  resources :contacts
end
