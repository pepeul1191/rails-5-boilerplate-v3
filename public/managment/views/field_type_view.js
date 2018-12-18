var FieldTypeView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
    this.tablaFieldType =  new TableView(dataTablaFieldType);
	},
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    // tabla deparment
    "click #tablaFieldType > tfoot > tr > td > button.agregar-fila": "agregarFilaFieldType",
		"click #tablaFieldType > tfoot > tr > td > button.guardar-tabla": "guardarTablaFieldType",
		"keyup #tablaFieldType > tbody > tr > td > input.text": "inputTextEscribirFieldType",
    "click #tablaFieldType > tbody > tr > td > i.quitar-fila": "quitarFilaFieldType",
  },
  render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'managment/templates/field_types.html',
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
  inputTextEscribirFieldType: function(event){
    this.tablaFieldType.inputTextEscribir(event);
  },
  quitarFilaFieldType: function(event){
    this.tablaFieldType.quitarFila(event);
  },
  guardarTablaFieldType: function(event){
    this.tablaFieldType.guardarTabla(event);
  },
  agregarFilaFieldType: function(event){
    this.tablaFieldType.agregarFila(event);
  },
});
