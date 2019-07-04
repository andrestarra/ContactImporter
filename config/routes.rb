Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'

  resources :contacts_files do
    resources :field_columns
  end
  post 'contacts_file/proccess_file'
end
