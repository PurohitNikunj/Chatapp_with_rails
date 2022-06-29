Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
  root "homes#chatroom"
  get "chatroom/:room_id", to: "homes#chatroom", as: "chatroom"
  resources :users
  post 'new/message', to: "messages#create", as: "new_message"
  get 'sign_in', to: "sessions#sign_in", as: "sign_in"
  post 'sign_in', to: "sessions#post_sign_in"
  delete 'log_out', to: "sessions#log_out", as: "logout"
  resources :chat_rooms
  get 'join_room/:chat_room_id', to: "chat_rooms#join_room", as: "join_room"
  get '/owner', to: "chat_rooms#owner", as: "owner"
  get 'accept_request/:chat_room_id/:requester_id', to: "chat_rooms#accept_request", as: "accept_request"
  get 'reject_request/:chat_room_id/:requester_id', to: "chat_rooms#reject_request", as: "reject_request"
  get '/see_request/:chat_room_id', to: "chat_rooms#see_request", as: "see_requests"
end
