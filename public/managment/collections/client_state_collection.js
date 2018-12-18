var ClientStateCollection = Backbone.Collection.extend({
  model: ClientState,
  initialize: function(params) {
    this.targetMensaje = params["targetMensaje"];
  },
  llenarModels: function(){
    var responseData = [];
    var viewInstance = this;
    this.models = []; // para evitar que el primero sea nulo
    $.ajax({
      type: "GET",
      url: BASE_URL + "managment/client_state/list",
      data: {},
      headers: {
        [CSRF_KEY]: CSRF,
      },
      async: false,
      success: function(data){
        tempResponseData = JSON.parse(data);
        for (var i = 0; i < tempResponseData.length; i++) {
          var temp = {
            id: tempResponseData[i]["id"],
            nombre: tempResponseData[i]["name"],
          };
          responseData.push(temp);
        }
      },
      error: function(error){
        $("#" + viewInstance.targetMensaje).removeClass("color-success");
        $("#" + viewInstance.targetMensaje).removeClass("color-warning");
        $("#" + viewInstance.targetMensaje).addClass("color-danger");
        $("#" + viewInstance.targetMensaje).html("Error en listar los estados del cliente");
        $("html, body").animate({ scrollTop: $("#" + viewInstance.targetMensaje).offset().top }, 1000);
        console.log(error);
      }
    });
    if(responseData.length > 0){
      for(var i = 0; i < responseData.length; i++){
        var modelo = new this.model(responseData[i]);
        this.models.push(modelo);
      }
    }
  },
  obtenerModels: function(){
    return this.models;
  },
});
