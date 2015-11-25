Rails.application.routes.draw do

  scope '(:locale)', :locale => /en/ do
    root 'static_pages#home'
    get 'static_pages/home'
    get 'pricing'        => 'static_pages#pricing'
    get 'faq'            => 'static_pages#faq'
    get 'blog'           => 'static_pages#blog'
    get 'translator'     => 'static_pages#translators'
    get 'privacy_policy' =>'static_pages#privacy_policy'
    get 'contact'        => 'static_pages#contact'
    get 'signup'         => 'users#new'
    get 'login'          => 'sessions#new'
    post 'login'         => 'sessions#create'
    delete 'logout'      => 'sessions#destroy'

    get 'sessions/new'

    resources :words, only:[:index]

    resources :lessons, only: [:create, :show, :edit, :update]
    resources :categories, only: :index
    resources :users
    resources	:static_pages
    resources :relationships, only: [:create, :destroy]
    resources :users do
      resources :followers, only: [:index, :show]
      resources :followings, only: [:index, :show]
    end

    namespace :admin do
      resources :users
    end
  end
end