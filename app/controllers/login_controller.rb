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
    lang = get_language()
    contents = get_content('login/index')[lang]
    @locals = {
      :title => 'Bienvenido',
      :message => '',
      :message_type => '',
      :css => LoginHelper::index_css,
      :js => LoginHelper::managment_js,
      :contents => contents,
      :lang => lang,
    }
    render template: 'login/index', layout: 'blank'
  end

  def index
    lang = get_language()
    contents = get_content('login/index')[lang]
    @locals = {
      :title => 'Bienvenido',
      :message => '',
      :message_type => '',
      :css => LoginHelper::index_css,
      :js => LoginHelper::managment_js,
      :contents => contents,
      :lang => lang,
    }
    render template: 'login/index', layout: 'blank'
  end

  def sign_in
    lang = get_language()
    contents = get_content('login/sign_in')[lang]
    puts '1 +++++++++++++++++++++++++++++++'
    puts contents['message_disable']
    puts '2 +++++++++++++++++++++++++++++++'
    @locals = {
      :title => 'Bienvenido',
      :message => contents['message_disable'] % [CONSTANTS[:base_url]],
      :message_type => 'color-error',
      :css => LoginHelper::index_css,
      :js => LoginHelper::managment_js,
      :contents => contents,
      :lang => lang,
    }
    render template: 'login/sign_in', layout: 'blank'
  end
end
