Rails.application.routes.draw do

  root 'welcome#index'

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post 'up-vote' => 'votes#up_vote', as: :up_vote
    post 'down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :users, only: [:new, :create, :show]
  post 'users/confirm' => 'users#confirm'

  resources :sessions, only: [:new, :create, :destroy]

  resources :advertisements

  resources :questions

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

end
