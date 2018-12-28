class Access::KeyController < ApplicationController
  def activation
    status = 200
    lang = get_language()
    user_id = params[:user_id]
    activation = params[:key]
    key = Access::UserKey.where(
      :user_id => user_id,
      :activation => activation
    ).first()
    if key == nil
      redirect_to CONSTANTS[:base_url] + 'access/error/404'
      return nil
    else
      # cambiar key
      key = Access::UserKey.where(
        :user_id => user_id,
        :activation => activation,
      ).first()
      key.activation = Assets::Randito.string_number(25)
      key.save
      # actualizar password de user
      user = Access::User.where(
        :id => params[:user_id],
      ).first()
      user.user_state_id = 1
      user.save
    end
    contents = get_content('key/activation')[lang]
    @locals = {
      :title => get_titles()[lang]['key_activation'],
      :message => '',
      :contents => contents,
      :message_type => '',
      :css => Access::KeyHelper::index_css,
      :js => Access::KeyHelper::index_js,
    }
    render template: 'access/key/activation', layout: 'blank'
  end
end
