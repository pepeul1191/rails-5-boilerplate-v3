class LoginController < ApplicationController
  include LoginHelper

  def managment
    lang = get_language()
    @locals = {
      :title => get_titles()[lang]['login_mangament'],
      :message => '',
      :css => LoginHelper::managment_css,
      :js => LoginHelper::managment_js,
    }
    render template: 'login/managment', layout: 'blank'
  end

  def access_managment
    status = 500
    message = ''
    lang = get_language()
    _continue = true
    user = AccessLocal::User.where(
      :usuario => params[:usuario],
      :contrasenia => params[:contrasenia]
    ).first()
    if user != nil
      if user.estado_usuario_id == 1
        # active -> create session and redirect to /managment
        _continue = false
        session[:status] = 'active'
        session[:user] = params[:user]
        session[:system] = 'managment'
        session[:time] = Time.now.strftime('%Y-%m-%d %H:%M:%S')
        redirect_to CONSTANTS[:base_url]
      else
        message = 'Usuario no se encuentra activo'
      end
    else
      message = 'Usuario o contraseña no válidos'
    end
    if _continue == true
      @locals = {
        :title => get_titles()[lang]['login_mangament'],
        :message => message,
        :css => LoginHelper::managment_css,
        :js => LoginHelper::managment_js,
      }
      render template: 'login/managment', layout: 'blank'
    end
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
