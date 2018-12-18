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
  # managment
  get 'managment/' => 'managment/view#index'
  get 'managment/department/list' => 'managment/department#list'
  post 'managment/department/save' => 'managment/department#save'
  get 'managment/province/list/:deparment_id' => 'managment/province#list'
  post 'managment/province/save' => 'managment/province#save'
  get 'managment/district/list/:province_id' => 'managment/district#list'
  get 'managment/district/get/:district_id' => 'managment/district#name_by_id'
  get 'managment/district/search' => 'managment/district#search'
  post 'managment/district/save' => 'managment/district#save'
  # access
  get 'access/' => 'access/view#index'
  # errores
  get 'error/access/:id' => 'error#access'
  get '*unmatched_route' => 'application#not_found'
  post '*unmatched_route' => 'application#not_found'
end
