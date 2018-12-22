module Access::ViewHelper
  def self.index_css
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
        CONSTANTS[:static_url] + 'bower_components/bootstrap/dist/css/bootstrap.min',
        CONSTANTS[:static_url] + 'bower_components/font-awesome/css/font-awesome.min',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/assets/css/constants',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/assets/css/dashboard',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/assets/css/table',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/assets/css/autocomplete',
        CONSTANTS[:static_url] + 'assets/css/constants-managment',
        CONSTANTS[:static_url] + 'assets/css/styles-managment',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/login.min',
      ]
    end
    rpta
  end

  def self.index_js
    rpta = nil
    if CONSTANTS[:ambiente] == 'desarrollo'
      rpta = [
        CONSTANTS[:static_url] + 'bower_components/jquery/dist/jquery.min',
        CONSTANTS[:static_url] + 'bower_components/bootstrap/dist/js/bootstrap.min',
        CONSTANTS[:static_url] + 'bower_components/underscore/underscore-min',
        CONSTANTS[:static_url] + 'bower_components/backbone/backbone-min',
        CONSTANTS[:static_url] + 'bower_components/handlebars/handlebars.min',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/layouts/application',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/views/table',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/views/modal',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/views/upload',
        CONSTANTS[:static_url] + 'bower_components/swp-backbone/views/autocomplete',
        CONSTANTS[:static_url] + 'access/models/permission',
        CONSTANTS[:static_url] + 'access/models/system',
        CONSTANTS[:static_url] + 'access/models/role',
        CONSTANTS[:static_url] + 'access/collections/permission_collection',
        CONSTANTS[:static_url] + 'access/collections/role_collection',
        CONSTANTS[:static_url] + 'access/collections/system_collection',
        CONSTANTS[:static_url] + 'access/data/table_system_data',
        CONSTANTS[:static_url] + 'access/data/table_permission_data',
        CONSTANTS[:static_url] + 'access/data/table_role_data',
        CONSTANTS[:static_url] + 'access/data/modal_system_permission_data',
        CONSTANTS[:static_url] + 'access/data/modal_system_role_data',
        CONSTANTS[:static_url] + 'access/views/system_view',
        CONSTANTS[:static_url] + 'access/views/system_permission_view',
        CONSTANTS[:static_url] + 'access/views/system_role_view',
        CONSTANTS[:static_url] + 'access/routes/access',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/login.min',
      ]
    end
    rpta
  end
end
