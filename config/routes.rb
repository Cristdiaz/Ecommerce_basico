Rails.application.routes.draw do
  
  root to: "home#index"
  devise_for :usuarios
  devise_for :administradores
  
  resources :categorias
  resources :productos

  resources :carros, only: [:show, :update] do
    member do 
      post  :pagar_con_paypal
      get   :procesar_pago_paypal
    end
  end
 
end
