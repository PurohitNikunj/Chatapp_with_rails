Rails.application.routes.draw do
  root "homes#chatroom"
  resources :users
  post 'new/message', to: "messages#create", as: "new_message"
  get 'sign_in', to: "sessions#sign_in", as: "sign_in"
  post 'sign_in', to: "sessions#post_sign_in"
  delete 'log_out', to: "sessions#log_out", as: "logout"
  mount ActionCable.server, at: '/cable'
end
