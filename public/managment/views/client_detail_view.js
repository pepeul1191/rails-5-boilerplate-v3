var ClientDetailView = Backbone.View.extend({
	el: '#workspace',
	context: [],
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.events = this.events || {};
		this.clientStateSelect =  new ClientStateCollection({
      targetMensaje: "defaultTargetMensajes",
    });
    this.bankSelect = new BankCollection({
      targetMensaje: "defaultTargetMensajes",
    });
		this.distritcAutocomplete= new AutocompleteView({
      el: "#formUbicaciones",
      nombre: "txtDistrict",
      targetMensajeError: "lblMensaje",
      targetSugerencias: "listaDistritos",
      mensajeError: "Ha ocurrido un error al buscar los distritos",
      url: BASE_URL + "managment/district/search",
      collection: new DistrictCollection(),
      model: "District",
    });
		this.uploadLogo = new UploadView({
      el: "#formUpload",
      imagenId: "imagen_id",
      inputFileId: "input_file",
      buscarBtnId: "searchLogo",
      subirBtnId: "uploadLogo",
      verBtnId: "viewLogo",
      fileName: "file",
      lblMensaje: "mensajeRptaClient",
      mensajes: {
        "formatoNoValido": "Archivo formato no válido",
        "tamanioNoValido": "Tamaño de archivo no válido",
        "errorAjax": "Error de comunicación con el servidor",
        "success": "Se cargado el archivo",
      },
      url: BASE_URL + "file/upload",
      extraData: [
        {"llave": "key1", "domId": "txtExtraData1"},
        {"llave": "key2", "domId": "txtExtraData2"},
      ],
      maxSize: 3545850, //bytes
      allowTypes: ["image/png", "image/jpeg"],
      method: "POST",
      model: new Logo(),
    });
		this.tablaPicture =  new TableView(dataTablaPicture);
		this.tablaService =  new TableView(dataTablaClientService);
		this.tablaField =  new TableView(dataTablaClientField);
		this.tablaFieldType =  new TableView(dataTablaFieldFieldType);
		this.tablaFieldSchedule = new TableView(dataTablaFieldSchedule);
		this.client = new Client();
	},
  events: {
		"keyup #txtDistrict": "searchDistrict",
		"click #listaDistritos > .sugerencia": "clickSearcedhDistrict",
		"click #searchLogo": "searchFile",
		"click #uploadLogo": "uploadLogo",
		//"click #viewLogo": "viewLogo",
		// tablaa pictures
    "click #tablaPicture > tfoot > tr > td > button.agregar-fila": "agregarFilaPicture",
		"click #tablaPicture > tfoot > tr > td > button.guardar-tabla": "guardarTablaPicture",
		"keyup #tablaPicture > tbody > tr > td > input.text": "inputTextPicture",
		"click #tablaPicture > tbody > tr > td > i.quitar-fila": "quitarFilPicture",
		// file pictures
		"click #tablaPicture > tbody > tr > td > i.seleccionar-archivo": "fileSelect",
		"click #tablaPicture > tbody > tr > td > i.subir-archivo": "fileUpload",
		"click #tablaPicture > tbody > tr > td > i.ver-archivo": "fileView",
		// tabla services de client
		"change #tablaClientService > tbody > tr > td > .input-check": "clickCheckBoxClientService",
		"click #tablaClientService > tfoot > tr > td > button.guardar-tabla": "guardarTablaClientService",
		// tabla field de client
		"click #tablaClientField > tfoot > tr > td > button.agregar-fila": "agregarFilaField",
		"click #tablaClientField > tfoot > tr > td > button.guardar-tabla": "guardarTablaField",
		"keyup #tablaClientField > tbody > tr > td > input.text": "inputTextEscribirField",
    "click #tablaClientField > tbody > tr > td > i.quitar-fila": "quitarFilaField",
		"click #tablaClientField > tbody > tr > td > i.fieldType": "fieldType",
		"click #tablaClientField > tbody > tr > td > i.fieldSchedule": "fieldSchedule",
		// tabla services de client
		"change #tablaFieldType > tbody > tr > td > .input-check": "clickCheckBoxFieldType",
		"click #tablaFieldType > tfoot > tr > td > button.guardar-tabla": "guardarTablaFieldType",
		//btn detalle
		"click #btnGuardarDetalleCliente": "guardarDetalleCliente",
		// tabla field schedule de client
		"click #tablaFieldSchedule > tfoot > tr > td > button.agregar-fila": "agregarFilaSchedule",
		"click #tablaFieldSchedule > tbody > tr > td > i.scheduleGenerate": "generarSchedule",
		"keyup #tablaFieldSchedule > tbody > tr > td > input.text": "inputTextEscribirFieldSchedule",
		// client user
		"click #btnAsociarUsuario": "asociarUsuario",
  },
  render: function() {
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = this.context;
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'managment/templates/client_detail.html',
		   type: "GET",
		   async: false,
		   success: function(source) {
		   	var template = Handlebars.compile(source);
		   	template_compiled = template(data);
		   }
		});
		return template_compiled;
	},
	setModel: function(client_id){
		var thisView = this;
		$.ajax({
	   url: BASE_URL + 'managment/client/get/' + client_id,
	   type: "GET",
	   async: false,
	   success: function(data) {
			 if(data != ""){
	   	   data = JSON.parse(data);
				 thisView.client.set("id", data["id"]);
				 thisView.client.set("name", data["name"]);
		 		 thisView.client.set("phone", data["phone"]);
		 		 thisView.client.set("bank_id", data["bank_id"]);
		 		 thisView.client.set("account", data["account"]);
		 		 thisView.client.set("description", data["description"]);
		 		 thisView.client.set("file_url", data["file_url"]);
				 thisView.client.set("file_id", data["file_id"]);
		 		 thisView.client.set("address", data["address"]);
		 		 thisView.client.set("district_id", data["district_id"]);
				 thisView.client.set("district", data["district"]);
		 		 thisView.client.set("latitude", data["latitude"]);
		 		 thisView.client.set("longitude", data["longitude"]);
		 		 thisView.client.set("client_state_id", data["client_state_id"]);
			 }else{
				 //TODO no existe usuario a buscar
			 }
		 },
		 error: function(error){
       console.log(error);
     }
		});
	},
	//formulario
	llenarModelsSelect: function(){
    this.clientStateSelect.llenarModels();
    this.bankSelect.llenarModels();
  },
	searchDistrict: function(event){
		this.distritcAutocomplete.buscarCooincidencias(event);
	},
	clearForms: function(){
	  $("#txtName").val("");
	  $("#txtPhone").val("");
	  $("#cbmBank").val("E");
	  $("#txtAccount").val("");
	  $("#txtDescription").val("");
		$("#txtDistrict").val("");
	  //this.uploadLogo.model.get("file_id""");
	  $("#txtAddress").val("");
	  //this.distritcAutocomplete.model.get("id""");
	  $("#txtLatitude").val("");
	  $("#txtLongitude").val("");
	  $("#cbmClientState").val("E");
	},
	clickSearcedhDistrict: function(event){
		this.distritcAutocomplete.sugerenciaClick(event);
	},
	searchFile: function(event){
		this.uploadLogo.triggerInputFile(event);
	},
	uploadLogo: function(event){
		this.uploadLogo.subirFile();
	},
	//evnetos tablaa de pictures
  inputTextPicture: function(event){
    this.tablaPicture.inputTextEscribir(event);
  },
  quitarFilPicture: function(event){
    this.tablaPicture.quitarFila(event);
  },
  guardarTablaPicture: function(event){
		var client_id = this.client.get("id");
		if(client_id != "E"){
			this.tablaPicture.extraData = {
	      client_id: this.client.get("id"),
	    };
			this.tablaPicture.guardarTabla(event);
		}else{
			$("#mensajeRptaPicture").removeClass("color-success");
      $("#mensajeRptaPicture").removeClass("color-warning");
      $("#mensajeRptaPicture").addClass("color-danger");
      $("#mensajeRptaPicture").html("Debe de grabar primero al cliente");
		}
  },
  agregarFilaPicture: function(event){
		var client_id = this.client.get("id");
		if(client_id != "E"){
			this.tablaPicture.agregarFila(event);
		}else{
			$("#mensajeRptaPicture").removeClass("color-success");
      $("#mensajeRptaPicture").removeClass("color-warning");
      $("#mensajeRptaPicture").addClass("color-danger");
      $("#mensajeRptaPicture").html("Debe de grabar primero al cliente");
		}
  },
	fileSelect: function(event){
		this.tablaPicture.fileSelect(event);
	},
	fileUpload: function(event){
		this.tablaPicture.fileUpload(event);
	},
	fileView: function(event){
		this.tablaPicture.fileView(event);
	},
	//evnetos tablaa de client services
	clickCheckBoxClientService: function(event){
    this.tablaService.clickCheckBox(event);
  },
  guardarTablaClientService: function(event){
		var client_id = this.client.get("id");
		if(client_id != "E"){
			this.tablaService.extraData = {
				client_id: client_id,
			};
			this.tablaService.guardarTabla(event);
		}else{
			$("#mensajeRptaClientService").removeClass("color-success");
      $("#mensajeRptaClientService").removeClass("color-warning");
      $("#mensajeRptaClientService").addClass("color-danger");
      $("#mensajeRptaClientService").html("Debe de grabar primero al cliente");
		}
  },
	//btn detalle
	guardarDetalleCliente: function(event){
		this.client.set("name",  $("#txtName").val());
		this.client.set("phone",  $("#txtPhone").val());
		this.client.set("bank_id",  Number($("#cbmBank").val()));
		this.client.set("account",  $("#txtAccount").val());
		this.client.set("description",  $("#txtDescription").val());
		this.client.set("logo_url",  this.uploadLogo.model.get("file_id"));
		this.client.set("address",  $("#txtAddress").val());
		this.client.set("district_id",  this.distritcAutocomplete.model.get("id"));
		this.client.set("latitude",  $("#txtLatitude").val());
		this.client.set("longitude",  $("#txtLongitude").val());
		this.client.set("client_state_id",  Number($("#cbmClientState").val()));
		//this.client.set("user_id",  $("#").val());
		var viewInstance = this;
  	$.ajax({
      type: "POST",
      url: BASE_URL + "managment/client/save",
			data: {data: JSON.stringify(this.client.toJSON())},
			headers: {
				[CSRF_KEY]: CSRF,
			},
      async: false,
      success: function(data){
				$("#mensajeRptaClient").addClass("color-success");
				$("#mensajeRptaClient").removeClass("color-warning");
				$("#mensajeRptaClient").removeClass("color-danger");
				var mensaje = "Se ha editado al cliente";
				if(data != ""){ //se ha creado un cliente y se tiene el nuevo id
					viewInstance.client.set("id", data);
					mensaje = "Se ha agregado al cliente";
					$("#title-form").html("Editar cliente");
				}
				$("#mensajeRptaClient").html(mensaje);
      },
      error: function(error){
				$("#mensajeRptaClient").removeClass("color-success");
				$("#mensajeRptaClient").removeClass("color-warning");
				$("#mensajeRptaClient").addClass("color-danger");
				$("#mensajeRptaClient").html("Ocurrió un error en grabar al cliente");
        console.log(error);
      }
    });
	},
	//evnetos tablaa de client fields
	inputTextEscribirField: function(event){
    this.tablaField.inputTextEscribir(event);
  },
  quitarFilaField: function(event){
    this.tablaField.quitarFila(event);
  },
  guardarTablaField: function(event){
		var client_id = this.client.get("id");
		if(client_id != "E"){
			this.tablaField.extraData = {
				client_id: client_id,
			};
			this.tablaField.guardarTabla(event);
		}else{
			$("#mensajeRptaClientField").removeClass("color-success");
      $("#mensajeRptaClientField").removeClass("color-warning");
      $("#mensajeRptaClientField").addClass("color-danger");
      $("#mensajeRptaClientField").html("Debe de grabar primero al cliente");
		}
  },
  agregarFilaField: function(event){
		console.log(event.target.parentElement.parentElement.parentElement.parentElement.childNodes);
    this.tablaField.agregarFila(event);
  },
	fieldType: function(event){
		var fieldId = event.target.parentElement.parentElement.firstChild.innerHTML;
		//field types
    this.tablaFieldType.urlListar = BASE_URL + "managment/field/field_type/" + fieldId;
    this.tablaFieldType.fieldId = fieldId;
    this.tablaFieldType.limpiarBody();
    this.tablaFieldType.listar();
    $("#formTableFieldType").removeClass("oculto");
		$("#formTableFieldSchedule").addClass("oculto");
	},
	fieldSchedule: function(event){
		//schedules
		var fieldId = event.target.parentElement.parentElement.firstChild.innerHTML;
		$("#formTableFieldType").addClass("oculto");
		$("#formTableFieldSchedule").removeClass("oculto");
		this.tablaFieldSchedule.fieldId = fieldId;
    this.tablaFieldSchedule.limpiarBody();
		this.tablaFieldSchedule.urlListar = BASE_URL + "managment/schedule/list/" + fieldId;
    this.tablaFieldSchedule.fieldId = fieldId;
    this.tablaFieldSchedule.limpiarBody();
    this.tablaFieldSchedule.listar();
	},
	//eventos de la tabla field_field_type
	clickCheckBoxFieldType: function(event){
		this.tablaFieldType.clickCheckBox(event);
	},
	guardarTablaFieldType: function(event){
		var field_id = this.tablaFieldType.fieldId;
		if(field_id != "E"){
			this.tablaFieldType.extraData = {
				field_id: field_id,
			};
			this.tablaFieldType.guardarTabla(event);
		}else{
			$("#formTableFieldType").removeClass("color-success");
			$("#formTableFieldType").removeClass("color-warning");
			$("#formTableFieldType").addClass("color-danger");
			$("#formTableFieldType").html("Debe de grabar primero al cliente");
		}
	},
	//eventos de la tabla field_scheudle
	agregarFilaSchedule: function(event){
    this.tablaFieldSchedule.agregarFila(event);
  },
	inputTextEscribirFieldSchedule: function(event){
		this.tablaFieldSchedule.inputTextEscribir(event);
	},
	generarSchedule: function(event){
		var data = {};
		var t = event.target.parentElement.parentElement.childNodes;
		for(var i = 0; i < 5; i++){
		  switch (i) {
    	    case 0:
			  data.transaction = t[0].innerHTML;
    	      break;
    	    case 1:
			  data.hour_init = t[1].firstChild.value;
    	      break;
    	    case 2:
			  data.hour_end = t[2].firstChild.value;
    	      break;
    	    case 3:
			  data.date_init = t[3].firstChild.value;
    	      break;
    	    case 4:
			  data.date_end = t[4].firstChild.value;
    	      break;
		  }
		}
		data.field_id = this.tablaFieldSchedule.fieldId;
		if(data.transaction.lenght != 30){
			$.ajax({
	      type: "POST",
	      url: BASE_URL + "managment/schedule/generate",
				data: {data: JSON.stringify(data)},
				headers: {
					[CSRF_KEY]: CSRF,
				},
	      async: false,
	      success: function(data){
					$("#mensajeRptaFieldSchedule").addClass("color-success");
					$("#mensajeRptaFieldSchedule").removeClass("color-warning");
					$("#mensajeRptaFieldSchedule").removeClass("color-danger");
					$("#mensajeRptaFieldSchedule").html("Se ha creado un calendario");
					t[0].innerHTML = data;
	      },
	      error: function(error){
					$("#mensajeRptaFieldSchedule").removeClass("color-success");
					$("#mensajeRptaFieldSchedule").removeClass("color-warning");
					$("#mensajeRptaFieldSchedule").addClass("color-danger");
					var data = JSON.parse(error);
					$("#mensajeRptaFieldSchedule").html(data["mensaje"][0]);
	        console.log(error);
	      }
	    });
		}else{
			alert();
		}
	},
	//asociar usuario
	asociarUsuario: function(event){
		if(this.client.get("id") != "E"){
			var _this = this;
			$.ajax({
	      type: "POST",
	      url: BASE_URL + "managment/client/match_user",
				data: {
					client_id: _this.client.get("id"),
					user: $("#txtUser").val(),
				},
				headers: {
					[CSRF_KEY]: CSRF,
				},
	      async: false,
	      success: function(data){
					$("#mensajeRptaUser").addClass("color-success");
					$("#mensajeRptaUser").removeClass("color-warning");
					$("#mensajeRptaUser").removeClass("color-danger");
					$("#mensajeRptaUser").html("Se ha asociado el usuaurio al cliente");
	      },
	      error: function(xhr, status, error){
					console.error(xhr.responseText);
					var m = JSON.parse(xhr.responseText);
					$("#mensajeRptaUser").removeClass("color-success");
					$("#mensajeRptaUser").removeClass("color-warning");
					$("#mensajeRptaUser").addClass("color-danger");
					$("#mensajeRptaUser").html(m.mensaje[0]);
	      }
	    });
		}else{
			$("#mensajeRptaUser").removeClass("color-success");
			$("#mensajeRptaUser").removeClass("color-warning");
			$("#mensajeRptaUser").addClass("color-danger");
			$("#mensajeRptaUser").html("Debe de registrar primero al cliente");
		}
	},
});
