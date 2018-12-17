class LoginController < ApplicationController
  include LoginHelper

  def managment
    @locals = {
      :title => get_titles()[lang]['login_mangament'],
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
      :title => get_titles()[lang]['login_index'],
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
    @locals = {
      :title => get_titles()[lang]['login_sign_in'],
      :message => contents['message_disable'] % [CONSTANTS[:base_url]],
      :message_type => 'color-error',
      :css => LoginHelper::index_css,
      :js => LoginHelper::managment_js,
      :contents => contents,
      :lang => lang,
    }
    render template: 'login/sign_in', layout: 'blank'
  end

  def reset
    lang = get_language()
    contents = get_content('login/reset')[lang]
    @locals = {
      :title => get_titles()[lang]['login_reset'],
      :message => '',
      :message_type => '',
      :css => LoginHelper::index_css,
      :js => LoginHelper::managment_js,
      :contents => contents,
      :lang => lang,
    }
    render template: 'login/reset', layout: 'blank'
  end
end
