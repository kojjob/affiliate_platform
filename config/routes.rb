# config/routes.rb
Rails.application.routes.draw do
  namespace :admin do
    get "dashboards/index"
  end
  namespace :affiliates do
    get "dashboards/index"
  end
  namespace :traders do
    get "dashboards/index"
  end
  devise_for :users
  # Root route
  root "static_pages#home"

  # Static pages
  get "about", to: "static_pages#about"
  get "how-it-works", to: "static_pages#how_it_works"
  get "contact", to: "static_pages#contact"
  get "affiliate-program", to: "static_pages#affiliate_program"

  # Affiliate Resources
  get "getting-started", to: "static_pages#getting_started"
  get "commission-rates", to: "static_pages#commission_rates"
  get "payment-methods", to: "static_pages#payment_methods"
  get "marketing-tools", to: "static_pages#marketing_tools"
  get "support-center", to: "static_pages#support_center"
  get "press", to: "static_pages#press"

  # SEO routes
  get "sitemap.xml", to: "sitemaps#index", defaults: { format: :xml }
  get "robots.txt", to: "sitemaps#robots", defaults: { format: :text }

  # Health check endpoint for deployment
  get "up" => "rails/health#show", as: :rails_health_check

  # Future routes for the affiliate marketing platform
  # These will be uncommented when the respective controllers are created

  # devise_for :users

  # namespace :traders do
  #   resource :dashboard, only: [:index]
  #   resources :products
  #   resources :affiliate_links, only: [:index, :show]
  #   resources :commissions, only: [:index, :show]
  # end

  # namespace :affiliates do
  #   resource :dashboard, only: [:index]
  #   resources :affiliate_links
  #   resources :commissions, only: [:index, :show]
  #   resources :withdrawal_requests
  # end

  # namespace :admin do
  #   resource :dashboard, only: [:index]
  #   resources :users
  #   resources :products
  #   resources :affiliate_links
  #   resources :orders
  #   resources :commissions
  #   resources :withdrawal_requests
  # end

  # Public routes
  # resources :products, only: [:index, :show]
  # get "/r/:token", to: "affiliate_links#redirect", as: :affiliate_redirect
end
