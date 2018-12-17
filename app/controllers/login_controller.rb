class LoginController < ApplicationController
  include LoginHelper
  def managment
    @locals = {
      :title => 'Bienvenido',
      :message => '',
      :message_type => '',
      :css => LoginHelper::index_css,
      :js => LoginHelper::index_js,
    }
    render template: 'login/managment', layout: 'blank'
  end
end
