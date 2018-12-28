module Access::PasswordHelper
  def self.create_css
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
        CONSTANTS[:static_url] + 'bower_components/bootstrap/dist/css/bootstrap.min',
        CONSTANTS[:static_url] + 'bower_components/font-awesome/css/font-awesome.min',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/assets/css/constants',
        CONSTANTS[:static_url] + 'assets/css/constants',
        CONSTANTS[:static_url] + 'assets/css/styles',
        CONSTANTS[:static_url] + 'assets/css/login',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/login.min',
      ]
    end
    rpta
  end

  def self.create_css_ok
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
        CONSTANTS[:static_url] + 'bower_components/bootstrap/dist/css/bootstrap.min',
        CONSTANTS[:static_url] + 'bower_components/font-awesome/css/font-awesome.min',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/assets/css/constants',
        CONSTANTS[:static_url] + 'assets/css/constants',
        CONSTANTS[:static_url] + 'assets/css/password-create',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/login.min',
      ]
    end
    rpta
  end

  def self.create_js
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/login.min',
      ]
    end
    rpta
  end
end
