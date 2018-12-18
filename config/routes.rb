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
  # file
  post 'file/upload' => 'file#upload'
  # managment
  get 'managment/' => 'managment/view#index'
  # managment/department
  get 'managment/department/list' => 'managment/department#list'
  post 'managment/department/save' => 'managment/department#save'
  # managment/client
  get 'managment/client/list' => 'managment/client#list'
  post 'managment/client/save' => 'managment/client#save'
  # managment/province
  get 'managment/province/list/:deparment_id' => 'managment/province#list'
  post 'managment/province/save' => 'managment/province#save'
  # managment/district
  get 'managment/district/list/:province_id' => 'managment/district#list'
  get 'managment/district/get/:district_id' => 'managment/district#name_by_id'
  get 'managment/district/search' => 'managment/district#search'
  post 'managment/district/save' => 'managment/district#save'
  # managment/client_state
  get 'managment/client_state/list' => 'managment/client_state#list'
  # managment/service
  get 'managment/service/list' => 'managment/service#list'
  post 'managment/service/save' => 'managment/service#save'
  # managment/field_type
  get 'managment/field_type/list' => 'managment/field_type#list'
  post 'managment/field_type/save' => 'managment/field_type#save'
  # managment/bank
  get 'managment/bank/list' => 'managment/bank#list'
  post 'managment/bank/save' => 'managment/bank#save'
  # managment/banner
  get 'managment/banner/list' => 'managment/banner#list'
  post 'managment/banner/save' => 'managment/banner#save'
  # access
  get 'access/' => 'access/view#index'
  # errores
  get 'error/access/:id' => 'error#access'
  get '*unmatched_route' => 'application#not_found'
  post '*unmatched_route' => 'application#not_found'
end
