var BannerCollection = Backbone.Collection.extend({
  model: Banner,
  initialize: function(params) {
    if(params != null){
      this.targetMensaje = params["targetMensaje"];
    }
  },
  obtenerModels: function(){
    return this.models;
  },
});
