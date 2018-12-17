module ErrorHelper
  def self.access_css
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
        CONSTANTS[:static_url] + 'bower_components/bootstrap/dist/css/bootstrap.min',
        CONSTANTS[:static_url] + 'bower_components/font-awesome/css/font-awesome.min',
        CONSTANTS[:static_url] + 'assets/css/constants',
        CONSTANTS[:static_url] + 'assets/css/error',
        CONSTANTS[:static_url] + 'assets/css/errorsh',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/error.min',
      ]
    end
    rpta
  end

  def self.access_js
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
        CONSTANTS[:static_url] + 'bower_components/jquery/dist/jquery.min',
        CONSTANTS[:static_url] + 'bower_components/bootstrap/dist/js/bootstrap.min',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/error.min',
      ]
    end
    rpta
  end
end
