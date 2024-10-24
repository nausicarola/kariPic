Rails.application.routes.draw do
  devise_for :users

  # Rutas para fotos
  resources :photos, only: [ :new, :create, :index, :show ] do
    resources :comments, only: [ :create ] # Solo permitir crear comentarios
  end

  # Rutas para verificar la salud de la aplicación
  get "up", to: "rails/health#show", as: :rails_health_check

  # Rutas para PWA
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest

  # Define la ruta raíz
  root "photos#index"
end
