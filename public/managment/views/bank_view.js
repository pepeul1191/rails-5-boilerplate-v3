var BankView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
    this.tablaBank =  new TableView(dataTablaBank);
	},
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    // tabla deparment
    "click #tablaBank > tfoot > tr > td > button.agregar-fila": "agregarFilaBank",
		"click #tablaBank > tfoot > tr > td > button.guardar-tabla": "guardarTablaBank",
		"keyup #tablaBank > tbody > tr > td > input.text": "inputTextEscribirBank",
    "click #tablaBank > tbody > tr > td > i.quitar-fila": "quitarFilaBank",
  },
  render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'managment/templates/banks.html',
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
		this.tablaBank.listar();
	},
  //eventos tabla de roles
  inputTextEscribirBank: function(event){
    this.tablaBank.inputTextEscribir(event);
  },
  quitarFilaBank: function(event){
    this.tablaBank.quitarFila(event);
  },
  guardarTablaBank: function(event){
    this.tablaBank.guardarTabla(event);
  },
  agregarFilaBank: function(event){
    this.tablaBank.agregarFila(event);
  },
});
