Codeforfood::Application.routes.draw do

  root to: 'posts#index'

  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :pages
    resources :layouts
    resources :snippets
    resources :origins
    resources :puffer_users
    resources :posts
  end

  mount Puffer::Engine => '/'
  mount PufferPages::Engine => '/'

end
