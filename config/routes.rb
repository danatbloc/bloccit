Rails.application.routes.draw do

  root 'welcome#index'

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :advertisements

  resources :questions

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'


end
