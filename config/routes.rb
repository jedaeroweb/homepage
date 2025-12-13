Rails.application.routes.draw do
  root 'home#index'
  get 'feed',:to=>'home#feed'

  get 'en', :to=> 'home#index',:defaults => { :locale => 'en'}
  get 'ko', :to=> 'home#index',:defaults => { :locale => 'ko'}
  get 'ch', :to=> 'home#index',:defaults => { :locale => 'zh-CN'}

  #faqs
  resources :faqs, only:[:index,:show]

  #contacts
  resources :contacts, only:[:index,:create, :show]
  get "/contacts/new", to: redirect("/contacts")

  #intro
  get 'intro', :to=>'intro#company', as: 'intro'
  get 'intro/service', :to=>'intro#service', as: 'intro_service'
  get 'intro/program', :to=>'intro#program', as: 'intro_program'

  resources :programs
  resources :accounts
  resources :accounts_products
  resources :accounts_product_categories
  resources :product_categories
  resources :products
  resources :orders
  resources :reports
  resources :notices
  resources :users, :sitemap

  get 'install', :to=>'programs#install', as: 'program_install'

  devise_for :admins, :controllers => { :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'}
  devise_for :users, :controllers => {:omniauth_callbacks=>'users/omniauth_callbacks', :sessions => "users/sessions",:registrations => "users/registrations",:passwords => "users/passwords"}, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'}
  devise_scope :user do
    get '/login', to: 'users/sessions#new', as: :login_redirect
    delete '/logout', to: 'users/sessions#destroy', as: :logout_redirect
  end

  # 관리자
  namespace :admin do
    root to: 'home#index'

    resources :contacts
    resources :users
    resources :product_categories
    resources :products
    resources :orders
    resources :notices
    resources :faq_categories
    resources :faqs
  end
end
