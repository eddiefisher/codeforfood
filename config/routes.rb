Codeforfood::Application.routes.draw do

  resources :posts, only: [:index, :show]

  namespace :admin do
    resources :pages
    resources :layouts
    resources :snippets
    resources :origins
    resources :assets
    resources :puffer_users
  end

  mount Puffer::Engine => '/'
  mount PufferPages::Engine => '/'

end
