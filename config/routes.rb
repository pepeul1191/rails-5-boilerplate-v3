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
  # managment/field
  # managment/client
  get 'managment/client/list' => 'managment/client#list'
  post 'managment/client/save' => 'managment/client#save'
  get 'managment/client/get/:client_id' => 'managment/client#get'
  get 'managment/client/service/:client_id' => 'managment/client#service_list'
  post 'managment/client/service/save' => 'managment/client#service_save'
  get 'managment/client/field/:client_id' => 'managment/client#field_list'
  post 'managment/client/field/save' => 'managment/client#field_save'
  # managment/province
  get 'managment/province/list/:deparment_id' => 'managment/province#list'
  post 'managment/province/save' => 'managment/province#save'
  # managment/picture
  get 'managment/picture/list/:client_id' => 'managment/picture#list_by_client'
  post 'managment/picture/save' => 'managment/picture#save'
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
  # managment/field
  get 'managment/field/field_type/:field_id' => 'managment/field#field_type_list'
  post 'managment/field/field_type/save' => 'managment/field#field_type_save'
  # managment/field_type
  get 'managment/field_type/list' => 'managment/field_type#list'
  post 'managment/field_type/save' => 'managment/field_type#save'
  # managment/bank
  get 'managment/bank/list' => 'managment/bank#list'
  post 'managment/bank/save' => 'managment/bank#save'
  # managment/banner
  get 'managment/banner/list' => 'managment/banner#list'
  post 'managment/banner/save' => 'managment/banner#save'
  # managment/schedule
  get 'managment/schedule/list/:field_id' => 'schedules/schedule#list_by_field_id'
  post 'managment/schedule/generate' => 'schedules/schedule#generate'
  post 'managment/schedule/delete' => 'schedules/schedule#delete'
  # managment/correlation
  get 'managment/correlation/create' => 'managment/correlation#client_create'

  # access
  get 'access/' => 'access/view#index'
  get 'access/user' => 'access/view#user'
  post 'access/user/system_save' => 'access/user#system_save'
  post 'access/user/update_state' => 'access/user#update_state'
  post 'access/user/update_email' => 'access/user#update_email'
  get 'access/user/search' => 'access/user#search'
  post 'access/user/create' => 'access/user#create_from_managment'
  post 'access/user/update_pass' => 'access/user#update_pass'
  post 'access/user/resend_activation' => 'access/user#resend_activation'
  get 'access/user_log/list/:user_id' => 'access/user_log#list'
  get 'access/user_system/list/:user_id' => 'access/user#system_list'
  post 'access/user_system/save' => 'access/user#system_save'

  get 'access/user_role/list/:user_id/:system_id' => 'access/user#role_list'
  post 'access/user_role/save' => 'access/role#role_save'

  get 'access/user_permission/list/:user_id/:system_id' => 'access/user#permission_list'
  post 'access/user_permission/save' => 'access/permission#permission_save'
  # permission
  get 'access/permission/list/:system_id' => 'access/permission#list'
  post 'access/permission/save' => 'access/permission#save'
  # role
  get 'access/role/list/:system_id' => 'access/role#list'
  post 'access/role/save' => 'access/role#save'
  # role/permission
  get 'access/role/permission/list/:system_id/:role_id' => 'access/role#permission_list'
  post 'access/role/permission/save' => 'access/role#permission_save'
  # system
  get 'access/system/list' => 'access/system#list'
  post 'access/system/save' => 'access/system#save'

  # errores
  get 'error/access/:id' => 'error#access'
  get '*unmatched_route' => 'application#not_found'
  post '*unmatched_route' => 'application#not_found'
end
