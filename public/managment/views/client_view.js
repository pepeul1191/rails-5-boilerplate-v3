var ClientView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
    this.tablaClient =  new TableView(dataTablaClient);
	},
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    // tabla client
    "click #tablaClient > tfoot > tr > td > button.agregar-fila": "agregarFilaClient",
		"click #tablaClient > tfoot > tr > td > button.guardar-tabla": "guardarTablaClient",
		"keyup #tablaClient > tbody > tr > td > input.text": "inputTextEscribirClient",
    "click #tablaClient > tbody > tr > td > i.quitar-fila": "quitarFilaClient",
  },
  render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'managment/templates/clients.html',
		   type: "GET",
		   async: false,
		   success: function(source) {
		   	var template = Handlebars.compile(source);
		   	template_compiled = template(data);
		   }
		});
		return template_compiled;
	},
	mostrarTabla: function(){
		this.tabla.listar();
	},
  //eventos tabla de roles
  inputTextEscribirClient: function(event){
    this.tablaClient.inputTextEscribir(event);
  },
  quitarFilaClient: function(event){
    this.tablaClient.quitarFila(event);
  },
  guardarTablaClient: function(event){
    this.tablaClient.guardarTabla(event);
  },
  agregarFilaClient: function(event){
    this.tablaClient.agregarFila(event);
  },
});
