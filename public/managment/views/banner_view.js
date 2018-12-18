var BannerView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
    this.tablaBanner =  new TableView(dataTablaBanner);
	},
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    // tabla deparment
    "click #tablaBanner > tfoot > tr > td > button.agregar-fila": "agregarFilaBanner",
		"click #tablaBanner > tfoot > tr > td > button.guardar-tabla": "guardarTablaBanner",
		"keyup #tablaBanner > tbody > tr > td > input.text": "inputTextEscribirBanner",
    "click #tablaBanner > tbody > tr > td > i.quitar-fila": "quitarFilaBanner",
    "click #tablaBanner > tbody > tr > td > i.seleccionar-archivo": "fileSelect",
    "click #tablaBanner > tbody > tr > td > i.subir-archivo": "fileUpload",
    "click #tablaBanner > tbody > tr > td > i.ver-archivo": "fileView",
  },
  render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'managment/templates/banners.html',
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
		this.tablaBanner.listar();
	},
  //eventos tabla de roles
  inputTextEscribirBanner: function(event){
    this.tablaBanner.inputTextEscribir(event);
  },
  quitarFilaBanner: function(event){
    this.tablaBanner.quitarFila(event);
  },
  guardarTablaBanner: function(event){
    this.tablaBanner.guardarTabla(event);
  },
  agregarFilaBanner: function(event){
    this.tablaBanner.agregarFila(event);
  },
  fileSelect: function(event){
    this.tablaBanner.fileSelect(event);
  },
  fileUpload: function(event){
    this.tablaBanner.fileUpload(event);
  },
  fileView: function(event){
    this.tablaBanner.fileView(event);
  },
});
