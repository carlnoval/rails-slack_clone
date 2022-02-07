Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # nesting this way allows chatroom_id access from url when doing things with messages
  # routes has nothing to do with database
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
