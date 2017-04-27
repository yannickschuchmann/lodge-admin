Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  root 'static#start'

  resources :guestbook_posts, controller: 'guestbook', path: 'hüttenbuch'
  resources :pages
  resources :users

  post 'images/upload' => 'image#upload'

  get '/check.txt', to: proc {[200, {}, ['simple_check']]}  

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
