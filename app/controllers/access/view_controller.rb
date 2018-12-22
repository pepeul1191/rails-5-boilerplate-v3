class Access::ViewController < ApplicationController
  def index
    lang = get_language()
    menu = get_content('_menus')[lang]['managment']
    html_modules = ApplicationHelper::menu_modules(menu, 'access/')
    html_items = ApplicationHelper::menu_items(menu, 'access/')
    @locals = {
      :title => get_titles()[lang]['managment_index'],
      :message => '',
      :css => Access::ViewHelper::index_css,
      :js => Access::ViewHelper::index_js,
      :html_modules => html_modules,
      :html_items => html_items,
    }
    render template: 'access/view/index', layout: 'app'
  end

  def user
    lang = get_language()
    menu = get_content('_menus')[lang]['managment']
    html_modules = ApplicationHelper::menu_modules(menu, 'access/')
    html_items = ApplicationHelper::menu_items(menu, 'access/')
    @locals = {
      :title => get_titles()[lang]['managment_index'],
      :message => '',
      :css => Access::ViewHelper::user_css,
      :js => Access::ViewHelper::user_js,
      :html_modules => html_modules,
      :html_items => html_items,
    }
    render template: 'access/view/user', layout: 'app'
  end
end
