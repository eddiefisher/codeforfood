Codeforfood::Application.routes.draw do

  namespace :admin do
    resources :puffer_users
  end

  mount Puffer::Engine => '/'
  mount PufferPages::Engine => '/'

end
