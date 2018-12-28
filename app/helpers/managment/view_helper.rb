module Managment::ViewHelper
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
        CONSTANTS[:static_url] + 'assets/css/constants-app',
        CONSTANTS[:static_url] + 'assets/css/styles-app',
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
        CONSTANTS[:static_url] + 'managment/models/department',
        CONSTANTS[:static_url] + 'managment/models/province',
        CONSTANTS[:static_url] + 'managment/models/district',
        CONSTANTS[:static_url] + 'managment/models/service',
        CONSTANTS[:static_url] + 'managment/models/field_type',
        CONSTANTS[:static_url] + 'managment/models/field_schedule',
        CONSTANTS[:static_url] + 'managment/models/bank',
        CONSTANTS[:static_url] + 'managment/models/logo',
        CONSTANTS[:static_url] + 'managment/models/client_state',
        CONSTANTS[:static_url] + 'managment/models/picture',
        CONSTANTS[:static_url] + 'managment/models/client',
        CONSTANTS[:static_url] + 'managment/models/field',
        CONSTANTS[:static_url] + 'managment/models/banner',
        CONSTANTS[:static_url] + 'managment/collections/field_collection',
        CONSTANTS[:static_url] + 'managment/collections/client_state_collection',
        CONSTANTS[:static_url] + 'managment/collections/department_collection',
        CONSTANTS[:static_url] + 'managment/collections/province_collection',
        CONSTANTS[:static_url] + 'managment/collections/district_collection',
        CONSTANTS[:static_url] + 'managment/collections/service_collection',
        CONSTANTS[:static_url] + 'managment/collections/field_type_collection',
        CONSTANTS[:static_url] + 'managment/collections/field_schedule_collection',
        CONSTANTS[:static_url] + 'managment/collections/bank_collection',
        CONSTANTS[:static_url] + 'managment/collections/picture_collection',
        CONSTANTS[:static_url] + 'managment/collections/banner_collection',
        CONSTANTS[:static_url] + 'managment/collections/client_collection',
        CONSTANTS[:static_url] + 'managment/data/table_department_data',
        CONSTANTS[:static_url] + 'managment/data/table_bank_data',
        CONSTANTS[:static_url] + 'managment/data/table_province_data',
        CONSTANTS[:static_url] + 'managment/data/table_district_data',
        CONSTANTS[:static_url] + 'managment/data/table_client_data',
        CONSTANTS[:static_url] + 'managment/data/table_service_data',
        CONSTANTS[:static_url] + 'managment/data/table_field_type_data',
        CONSTANTS[:static_url] + 'managment/data/table_field_schedule_data',
        CONSTANTS[:static_url] + 'managment/data/table_pictures_data',
        CONSTANTS[:static_url] + 'managment/data/table_client_service_data',
        CONSTANTS[:static_url] + 'managment/data/table_client_field_data',
        CONSTANTS[:static_url] + 'managment/data/table_banner_data',
        CONSTANTS[:static_url] + 'managment/views/location_view',
        CONSTANTS[:static_url] + 'managment/views/bank_view',
        CONSTANTS[:static_url] + 'managment/views/service_view',
        CONSTANTS[:static_url] + 'managment/views/field_type_view',
        CONSTANTS[:static_url] + 'managment/views/client_detail_view',
        CONSTANTS[:static_url] + 'managment/views/banner_view',
        CONSTANTS[:static_url] + 'managment/views/client_view',
        CONSTANTS[:static_url] + 'managment/routes/managment',
      ]
    else
      rpta = [
        CONSTANTS[:static_url] + 'dist/login.min',
      ]
    end
    rpta
  end
end
