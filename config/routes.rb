Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  root 'content#start'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
