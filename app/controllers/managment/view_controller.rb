class Managment::ViewController < ApplicationController
  def index
    Access::UserService.new
    Access::LogService.new
    puts '1 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
    puts Assets::Cipher.encrypt(CONSTANTS[:key], 'hola mundo')
    puts Assets::Cipher::decrypt(CONSTANTS[:key], 'CF7D69A989E1656C1060C3F3A358819C')
    puts '2 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
    lang = get_language()
    menu = get_content('_menus')[lang]['managment']
    html_modules = ApplicationHelper::menu_modules(menu, 'managment/')
    html_items = ApplicationHelper::menu_items(menu, 'managment/')
    @locals = {
      :title => get_titles()[lang]['managment_index'],
      :message => '',
      :css => Managment::ViewHelper::index_css,
      :js => Managment::ViewHelper::index_js,
      :html_modules => html_modules,
      :html_items => html_items,
    }
    render template: 'managment/view/index', layout: 'app'
  end
end
