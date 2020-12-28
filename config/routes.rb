Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => 'emails#index'

  post 'order-creation' => 'emails#receive_order_created'
  post 'ajax-order-creation' => 'emails#receive_ajax'
  
end
