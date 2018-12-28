class LoginController < ApplicationController
  include LoginHelper
  before_action -> { session_false_view('managment') },
    only: [:managment]
  before_action -> { session_false_view('providers') },
    only: [:index]
  before_action -> { session_true },
    only: [:view, ]

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
    user = Access::VWUserStateSystem.where(
      :user => params[:user],
      :pass => Assets::Cipher.encrypt(CONSTANTS[:key], params[:pass]),
      :system => 'managment'
    ).first()
    if user != nil
      if user.user_state_id == 1
        # active -> create session and redirect to /managment
        _continue = false
        session[:status] = 'active'
        session[:user] = params[:user]
        if !session[:systems]
          session[:systems] = []
        end
        session[:systems].push('managment')
        session[:time] = Time.now.strftime('%Y-%m-%d %H:%M:%S')
        session[:home] = CONSTANTS[:base_url] + 'access'
        session[:login] = CONSTANTS[:base_url] + 'login/managment'
        redirect_to CONSTANTS[:base_url] + 'managment'
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

  def index_post
    status = 500
    message = ''
    lang = get_language()
    _continue = true
    user = Access::VWUserStateSystem.where(
      :user => params[:user],
      :pass => Assets::Cipher.encrypt(CONSTANTS[:key], params[:pass]),
      :system => 'providers'
    ).first()
    if user != nil
      if user.user_state_id == 1
        # active -> create session and redirect to /managment
        _continue = false
        session[:status] = 'active'
        session[:user] = params[:user]
        if !session[:systems]
          session[:systems] = []
        end
        session[:systems].push('providers')
        session[:time] = Time.now.strftime('%Y-%m-%d %H:%M:%S')
        session[:home] = CONSTANTS[:base_url] + 'access'
        session[:login] = CONSTANTS[:base_url] + 'login/managment'
        redirect_to CONSTANTS[:base_url] + 'providers'
      else
        message = 'Usuario no se encuentra activo'
      end
    else
      message = 'Usuario o contraseña no válidos'
    end
    if _continue == true
      contents = get_content('login/index')[lang]
      @locals = {
        :title => get_titles()[lang]['login_index'],
        :message => message,
        :message_type => 'color-error',
        :css => LoginHelper::index_css,
        :js => LoginHelper::managment_js,
        :contents => contents,
        :lang => lang,
      }
      render template: 'login/index', layout: 'blank'
    end
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
    message = ''
    message_type = 'color-error'
    @locals = {
      :title => get_titles()[lang]['login_reset'],
      :message => '',
      :message_type => '',
      :css => LoginHelper::index_css,
      :js => LoginHelper::managment_js,
      :message => message,
      :message_type => message_type,
      :contents => contents,
      :lang => lang,
    }
    render template: 'login/reset', layout: 'blank'
  end

  def reset_post
    lang = get_language()
    contents = get_content('login/reset')[lang]
    status = 200
    message = ''
    message_type = 'color-error'
    # obtener usuario
    user = Access::User.where(
      :email => params[:email]
    ).first
    if user == nil
      status = 500
      message = 'Correo no registrado'
    else
      # obtener llave
      e = Access::UserKey.where(
        :user_id => user.id
      ).first
      key = Assets::Randito.string_number(25)
      e.reset = key
      e.save
      # mandar correo de cambio de contraseña
      mail = Mail::NotificationService.new
      data = {
        :user_id => user.id,
        :reset_key => key,
        :lang => 'sp',
        :to => user.email,
        :base_url => SERVICES[:mobile_back][:url] + 'password/update/'
      }
      mail.reset_password(data)
      message = 'Solicitud de cambio de contreseña enviada a correo'
      message_type = 'color-success'
    end
    @locals = {
      :title => get_titles()[lang]['login_reset'],
      :message => '',
      :message_type => '',
      :css => LoginHelper::index_css,
      :js => LoginHelper::managment_js,
      :message => message,
      :message_type => message_type,
      :contents => contents,
      :lang => lang,
    }
    render template: 'login/reset', layout: 'blank', status: status
  end

  def view
    rpta = 'usuario : ' + session[:user] + '</br>' +
      'estado : ' + session[:status] + '</br>' +
      'tiempo : ' + session[:time] + '</br>' +
      'sistema : ' + session[:systems].to_s + '</br>' +
      '<a style="margin-top:10px; display: block;width: 115px;height: 20px;background: #4E9CAF;padding: 10px;text-align: center;border-radius: 0px;color: white;font-weight: bold;" href="' + CONSTANTS[:base_url] + 'login">Regresar</a>'
    render :inline => rpta
  end

  def close
    reset_session
    redirect_to CONSTANTS[:home]
  end
end
