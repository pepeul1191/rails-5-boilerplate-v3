module ApplicationHelper
  def load_css
    rpta = ''
    if defined? @locals[:css]
      @locals[:css].each do |n|
        temp = '<link href="' + n + '.css" rel="stylesheet"/>'
        rpta = rpta + temp
      end
    end
    rpta.html_safe
  end

  def load_js
    rpta = ''
    if defined? @locals[:js]
      @locals[:js].each do |n|
        temp = '<script src="' + n + '.js" type="text/javascript"></script>'
        rpta = rpta + temp
      end
    end
    rpta.html_safe
  end

  def self.menu_modules(menu, url_active)
    rpta = ''
    menu.each do |m|
      t = ''
      if url_active == m['url']
        t = '<a href="' + CONSTANTS[:base_url] + m['url'] + '" class="nav-active">' + m['name'] + '</a>'
      else
        t = '<a href="' + CONSTANTS[:base_url] + m['url'] + '" class="">' + m['name'] + '</a>'
      end
      rpta = rpta + t
    end
    rpta
  end

  def menu_items

  end
end
