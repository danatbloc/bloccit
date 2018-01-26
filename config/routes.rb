Rails.application.routes.draw do
  get 'advertisements/index'

  get 'advertisements/show'

  get 'advertisements/new'

  get 'advertisements/create'

  root 'welcome#index'

  resources :posts

  resources :advertisements

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'


end
