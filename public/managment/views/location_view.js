var LocationView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
    this.tablaDepartment =  new TableView(dataTablaDepartment);
    this.tablaProvince = new TableView(dataTablaProvince);
		this.tablaDistrict = new TableView(dataTablaDistrict);
	},
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    // tabla deparment
    "click #tablaDepartment > tfoot > tr > td > button.agregar-fila": "agregarFilaDeparment",
		"click #tablaDepartment > tfoot > tr > td > button.guardar-tabla": "guardarTablaDeparment",
		"keyup #tablaDepartment > tbody > tr > td > input.text": "inputTextEscribirDeparment",
    "click #tablaDepartment > tbody > tr > td > i.quitar-fila": "quitarFilaDepartment",
    "click #tablaDepartment > tbody > tr > td > i.provinces": "provinces",
    // tabla province
		"click #tablaProvince > tfoot > tr > td > button.agregar-fila": "agregarFilaProvince",
		"click #tablaProvince > tfoot > tr > td > button.guardar-tabla": "guardarTablaProvince",
		"keyup #tablaProvince > tbody > tr > td > input.text": "inputTextEscribirProvince",
    "click #tablaProvince > tbody > tr > td > i.quitar-fila": "quitarFilaProvince",
    "click #tablaProvince > tbody > tr > td > i.districts": "districts",
		// tabla district
		"click #tablaDistrict > tfoot > tr > td > button.agregar-fila": "agregarFilaDistrict",
		"click #tablaDistrict > tfoot > tr > td > button.guardar-tabla": "guardarTablaDistrict",
		"keyup #tablaDistrict > tbody > tr > td > input.text": "inputTextEscribirDistrict",
    "click #tablaDistrict > tbody > tr > td > i.quitar-fila": "quitarFilaDistrict",
  },
  render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'managment/templates/locations.html',
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
  //eventos tabla de departamentos
  inputTextEscribirDeparment: function(event){
    this.tablaDepartment.inputTextEscribir(event);
  },
  quitarFilaDepartment: function(event){
    this.tablaDepartment.quitarFila(event);
  },
  guardarTablaDeparment: function(event){
    //this.tablaDepartment.extraData = {sistema_id: this.sistemaId};
    this.tablaDepartment.guardarTabla(event);
  },
  agregarFilaDeparment: function(event){
    this.tablaDepartment.agregarFila(event);
  },
  provinces: function(event){
    var departmentId = event.target.parentElement.parentElement.firstChild.innerHTML;
    this.tablaProvince.urlListar =
      limpiarURL(BASE_URL + "managment/province/list/" , departmentId);
    this.tablaProvince.departmentId = departmentId;
    this.tablaProvince.limpiarBody();
    this.tablaProvince.listar();
    $("#formTableProvince").removeClass("oculto");
  },
  //eventos tabla de provincias
	inputTextEscribirProvince: function(event){
    this.tablaProvince.inputTextEscribir(event);
  },
  quitarFilaProvince: function(event){
    this.tablaProvince.quitarFila(event);
  },
  guardarTablaProvince: function(event){
		console.log(this.tablaProvince);
    this.tablaProvince.extraData = {department_id: this.tablaProvince.departmentId};
    this.tablaProvince.guardarTabla(event);
  },
  agregarFilaProvince: function(event){
    this.tablaProvince.agregarFila(event);
  },
	districts: function(event){
    var provinceId = event.target.parentElement.parentElement.firstChild.innerHTML;
    this.tablaDistrict.urlListar =
      limpiarURL(BASE_URL + "managment/district/list/" , provinceId);
    this.tablaDistrict.provinceId = provinceId;
    this.tablaDistrict.limpiarBody();
    this.tablaDistrict.listar();
    $("#formTableDistrict").removeClass("oculto");
  },
	//eventos tabla de distritos
	inputTextEscribirDistrict: function(event){
		this.tablaDistrict.inputTextEscribir(event);
	},
	quitarFilaDistrict: function(event){
		this.tablaDistrict.quitarFila(event);
	},
	guardarTablaDistrict: function(event){
		console.log(this.tablaDistrict);
		this.tablaDistrict.extraData = {province_id: this.tablaDistrict.provinceId};
		this.tablaDistrict.guardarTabla(event);
	},
	agregarFilaDistrict: function(event){
		this.tablaDistrict.agregarFila(event);
	},
});
