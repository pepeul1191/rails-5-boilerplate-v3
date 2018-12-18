class Managment::ViewController < ApplicationController
  def index
    lang = get_language()
    menu = get_content('_menus')[lang]['managment']
    html_modules = ApplicationHelper::menu_modules(menu, 'managment/')
    @locals = {
      :title => get_titles()[lang]['managment_index'],
      :message => '',
      :css => Managment::ViewHelper::index_css,
      :js => Managment::ViewHelper::index_js,
      :html_modules => html_modules,
    }
    render template: 'managment/view/index', layout: 'app'
  end
end
