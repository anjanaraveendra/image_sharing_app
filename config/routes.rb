Rails.application.routes.draw do


  resources :gallery_attachments do
    resources :comments, module: :gallery_attachments
  end

  resources :galleries do
    resources :comments, module: :galleries
  end

  get 'home/index'

  devise_for :users
  resources :users do
    member do
      get :following, :followers, :albums
    end
  end

  root 'home#index'
  get 'home/user_gallery'
  get 'home/user_image'

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  resources :relationships, only: [:create, :destroy]


  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
end
