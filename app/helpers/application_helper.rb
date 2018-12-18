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

  def self.menu_items(menu, url_module_active)
    rpta = ''
    menu.each do |m|
      if url_module_active == m['url']
        subtitles = m['subtitles']
        subtitles.each do |s|
          t = '<li class="li-submodulo">' + s['name'] + '</li>'
          rpta = rpta + t
          items = s['items']
          items.each do |i|
            t = '<li class="li-item"><a href="' + CONSTANTS[:base_url] + i['url'] + '">' + i['name'] + '</a></li>'
            rpta = rpta + t
          end
        end
      end
    end
    rpta
  end
end
