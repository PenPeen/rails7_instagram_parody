Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }
  
  # TOPページ
  root 'posts#index'
  
  get 'pages/home'

  # プロフィール
  get 'users/:id', to: 'users#show', as: 'user'
  # 記事投稿
  resources :posts, only: [:index, :new, :create] do
    resources :photos, only: [:create]
  end

end
