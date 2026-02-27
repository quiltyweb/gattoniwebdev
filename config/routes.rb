Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "landing/home"
  get "landing/about" 
  get "landing/contact_us"
  get "landing/projects"
  get "landing/services", to: "landing#services"
  get "landing/accessibility_statement", to: "landing#accessibility_statement"
  
  resource :contacts, only: [:create]
  # get "about", to: "landing#about", as: :about
  # get "projects", to: "landing#projects", as: :projects
  # get "contact_us", to: "landing#contact_us", as: :contact_us
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "landing#home"
end
