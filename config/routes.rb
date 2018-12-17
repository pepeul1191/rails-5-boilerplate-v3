Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # errores
  get 'error/access/:id' => 'error#access'
  get '*unmatched_route' => 'application#not_found'
  post '*unmatched_route' => 'application#not_found'
end
