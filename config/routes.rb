Api::Application.routes.draw do
  resources :entries
  root 'welcome#index'
end
