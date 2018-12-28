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
    user = Access::User.where(
      :user => params[:user],
      :pass => Assets::Cipher.encrypt(CONSTANTS[:key], params[:pass])
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
