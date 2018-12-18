var ServiceView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
    this.tablaService =  new TableView(dataTablaService);
	},
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    // tabla deparment
    "click #tablaService > tfoot > tr > td > button.agregar-fila": "agregarFilaService",
		"click #tablaService > tfoot > tr > td > button.guardar-tabla": "guardarTablaService",
		"keyup #tablaService > tbody > tr > td > input.text": "inputTextEscribirService",
    "click #tablaService > tbody > tr > td > i.quitar-fila": "quitarFilaService",
  },
  render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'managment/templates/services.html',
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
  inputTextEscribirService: function(event){
    this.tablaService.inputTextEscribir(event);
  },
  quitarFilaService: function(event){
    this.tablaService.quitarFila(event);
  },
  guardarTablaService: function(event){
    this.tablaService.guardarTabla(event);
  },
  agregarFilaService: function(event){
    this.tablaService.agregarFila(event);
  },
});
