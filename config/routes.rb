Rails.application.routes.draw do
  post 'images/upload' => 'image#upload'

  resources :pages
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  root 'static#start'

  resources :users

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
