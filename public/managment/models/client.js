var Client = Backbone.Model.extend({
  defaults: {
    id: 'E',
    name: '',
    address: '',
    logo_url: '',
    description: '',
    latitude: '',
    longitude: '',
    account: '',
    phone: '',
    user_id: '',
    district_id : '',
    client_state_id: '',
    bank_id: '',
  },
  initialize: function() {
  },
});
