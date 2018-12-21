var PermissionView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
    this.tablePermission =  new TableView(dataTablePermission);
	},
	events: {
		// se está usando asignacion dinamica de eventos en el constructor
    //eventos tabla de departamentos
    // tabla permisos
    "click #tablePermission > tfoot > tr > td > button.agregar-fila": "agregarFilaPermission",
		"click #tablePermission > tfoot > tr > td > button.guardar-tabla": "guardarTablaPermission",
		"keyup #tablePermission > tbody > tr > td > input.text": "inputTextEscribirPermission",
    "click #tablePermission > tbody > tr > td > i.quitar-fila": "quitarFilaPermission",
	},
	render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'access/templates/permission.html',
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
		this.tablePermission.listar();
	},
  //evnetos tabla de permisos
  inputTextEscribirPermission: function(event){
    this.tablePermission.inputTextEscribir(event);
  },
  quitarFilaPermission: function(event){
    this.tablePermission.quitarFila(event);
  },
  guardarTablaPermission: function(event){
    this.tablePermission.guardarTabla(event);
  },
  agregarFilaPermission: function(event){
    this.tablePermission.agregarFila(event);
  },
});
