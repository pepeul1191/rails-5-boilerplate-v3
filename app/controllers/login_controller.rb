class LoginController < ApplicationController
  include LoginHelper

  def managment
    @locals = {
      :title => 'Bienvenido',
      :message => '',
      :message_type => '',
      :css => LoginHelper::managment_css,
      :js => LoginHelper::managment_js,
    }
    render template: 'login/managment', layout: 'blank'
  end

  def index
    @locals = {
      :title => 'Bienvenido',
      :message => '',
      :message_type => '',
      :css => LoginHelper::index_css,
      :js => LoginHelper::managment_js,
    }
    render template: 'login/index', layout: 'blank'
  end
end
