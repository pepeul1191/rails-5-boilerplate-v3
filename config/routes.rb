Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # login y sessiones
  get 'login/managment' => 'login#managment'
  post 'login/managment' => 'login#access_managment'
  get 'login' => 'login#index'
  get 'login/sign_in' => 'login#sign_in'
  get 'login/reset_password' => 'login#reset'
  get 'login/view' => 'login#view'
  get 'login/close' => 'login#close'
  # errores
  get 'error/access/:id' => 'error#access'
  get '*unmatched_route' => 'application#not_found'
  post '*unmatched_route' => 'application#not_found'
end
