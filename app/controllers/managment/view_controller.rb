class Managment::ViewController < ApplicationController
  before_action -> { session_true_view('managment') },
    only: [:index, ]
  def index
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
