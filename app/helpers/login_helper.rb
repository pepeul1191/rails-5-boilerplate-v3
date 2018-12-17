module LoginHelper
  def self.managment_css
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
        CONSTANTS[:static_url] + 'bower_components/bootstrap/dist/css/bootstrap.min',
        CONSTANTS[:static_url] + 'bower_components/font-awesome/css/font-awesome.min',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/assets/css/constants',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/assets/css/login',
        CONSTANTS[:static_url] + 'assets/css/constants-managment',
        CONSTANTS[:static_url] + 'assets/css/login-managment',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/login-managment.min',
      ]
    end
    rpta
  end

  def self.managment_js
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
        CONSTANTS[:static_url] + 'bower_components/jquery/dist/jquery.min',
        CONSTANTS[:static_url] + 'bower_components/bootstrap/dist/js/bootstrap.min',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/login.min',
      ]
    end
    rpta
  end

  def self.index_css
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
end
