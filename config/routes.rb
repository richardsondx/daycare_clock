Rails.application.routes.draw do
  get '/', to: 'auth#new', as: 'login'
  post '/', to: 'auth#authenticate', as: 'authenticate'
  delete '/', to: 'auth#delete', as: 'logout'

  resources :users , only: [:show] do
    put '/clocks/:option', to: 'clocks#touch_clock', as: 'touch_clock' 
    resources :clocks, only: [:new, :edit] do
      put '/update', to: 'clocks#update', as: 'update'
      delete '/', to: 'clocks#delete', as: 'delete'
    end
  end 

  resources :clock_events

  root to: 'auth#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
