var RoleView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
    this.tableRole =  new TableView(dataTableRole);
	},
	events: {
		// se está usando asignacion dinamica de eventos en el constructor
    //eventos tabla de departamentos
    // tabla permisos
    "click #tableRole > tfoot > tr > td > button.agregar-fila": "agregarFilaRole",
		"click #tableRole > tfoot > tr > td > button.guardar-tabla": "guardarTablaRole",
		"keyup #tableRole > tbody > tr > td > input.text": "inputTextEscribirRole",
    "click #tableRole > tbody > tr > td > i.quitar-fila": "quitarFilaRole",
	},
	render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'access/templates/role.html',
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
    alert('listar');
		this.tableRole.listar();
	},
  //evnetos tabla de permisos
  inputTextEscribirRole: function(event){
    this.tableRole.inputTextEscribir(event);
  },
  quitarFilaRole: function(event){
    this.tableRole.quitarFila(event);
  },
  guardarTablaRole: function(event){
    this.tableRole.guardarTabla(event);
  },
  agregarFilaRole: function(event){
    this.tableRole.agregarFila(event);
  },
});
