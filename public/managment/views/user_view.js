var UserView = Backbone.View.extend({
	el: '#userWorkspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
		this.message = $("#mensaje"),
		this.events = this.events || {};
		this.model = new User();
		this.states = [
			{id: 1, name: "Activo"},
			{id: 2, name: "Inactivo"},
			{id: 3, name: "Suspendido"},
			{id: 4, name: "Eliminado"},
			{id: 5, name: "Vacacionando"},
			{id: 6, name: "Activación Pendiente"},
			{id: 7, name: "Comṕleto"},
		];
	},
	events: {
    "click #btnBuscarUsuario": "buscarUsuario",
		"click #btnGenerarUsuario": "generarCorrelativo",
		"click #btnCrearUsuario": "crearUsuario",
		"click #btnActualizarCorreo": "actualizarCorreo",
		"click #btnCambiarContrasenia": "cambiarContrasenia",
		"click #btnReenviarActivacion": "reenviarActivacion",
		"click #btnActualizarEstado": "actualizarEstado",
  },
  buscarUsuario: function(event){
    var url = BASE_URL + "managment/user/search?user=" + $("#txtUsuario").val();
    var _this = this;
    $.ajax({
      type: "GET",
      url: url,
      data: { },
      headers: {
        [CSRF_KEY]: CSRF,
      },
      async: false,
      success: function(data){
				if(data == "not_found"){
					_this.message.removeClass("color-success");
					_this.message.removeClass("color-warning");
					_this.message.addClass("color-error");
					_this.message.html("Usuario no encontrado");
					_this.bloquearFormulario();
				}else{
        	_this.message.addClass("color-success");
					_this.message.removeClass("color-warning");
					_this.message.removeClass("color-error");
					_this.llenarFormulario(JSON.parse(data));
				}
      },
      error: function(error){
        console.error(error);
        _this.message.removeClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.addClass("color-error");
				_this.message.html("Ocurrió un error en realizar la búsqueda");
      }
    });
	},
	llenarFormulario: function(data){
		// disabled = false
		$("#cbmEstado").prop("disabled", false);
		$("#txtCorreo").prop("disabled", false);
		$("#btnActualizarCorreo").prop("disabled", false);
		$("#btnCambiarContrasenia").prop("disabled", false);
		$("#btnReenviarActivacion").prop("disabled", false);
		$("#btnActualizarEstado").prop("disabled", false);
		// llenar form
		$("#txtCorreo").val(data.email);
		$("#cbmEstado").val(data.state_id);
		// llenar models
		this.model.set("user_id", data.id);
		this.model.set("email", data.email);
		this.model.set("user_state_id", data.email);
	},
	bloquearFormulario: function(){
		// disabled = true
		$("#cbmEstado").prop("disabled", true);
		$("#txtCorreo").prop("disabled", true);
		$("#btnActualizarCorreo").prop("disabled", true);
		$("#btnCambiarContrasenia").prop("disabled", true);
		$("#btnReenviarActivacion").prop("disabled", true);
		$("#btnActualizarEstado").prop("disabled", true);
		// llenar form
		$("#txtCorreo").val("");
		$("#cbmEstado").val("E");
		// limpiar modelo
		this.model.clear().set(this.model.defaults);
	},
	actualizarCorreo: function(event){
		// update model
		this.model.set("email", $("#txtCorreo").val());
		// ajax
		var url = BASE_URL + "managment/user/update_email";
		var _this = this;
		$.ajax({
			type: "POST",
			url: url,
			data: {
				user_id: _this.model.get("user_id"),
				email: _this.model.get("email"),
			},
			headers: {
				[CSRF_KEY]: CSRF,
			},
			async: false,
			success: function(data){
				_this.message.html("Correo actualizado");
				_this.message.addClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.removeClass("color-error");
			},
			error: function(xhr, status, error){
				console.error(xhr.responseText);
				var m = JSON.parse(xhr.responseText);
				_this.message.html(m.mensaje[0]);
				_this.message.removeClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.addClass("color-error");
			}
		});
	},
	actualizarEstado: function(event){
		// update model
		this.model.set("user_state_id", $("#cbmEstado").val());
		// ajax
		var url = BASE_URL + "managment/user/update_state";
		var _this = this;
		$.ajax({
			type: "POST",
			url: url,
			data: {
				user_id: _this.model.get("user_id"),
				user_state_id: _this.model.get("user_state_id"),
			},
			headers: {
				[CSRF_KEY]: CSRF,
			},
			async: false,
			success: function(data){
				_this.message.html("Estado actualizado");
				_this.message.addClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.removeClass("color-error");
			},
			error: function(xhr, status, error){
				console.error(xhr.responseText);
				var m = JSON.parse(xhr.responseText);
				_this.message.html(m.mensaje[0]);
				_this.message.removeClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.addClass("color-error");
			}
		});
	},
	cambiarContrasenia: function(event){
		// ajax
		var url = BASE_URL + "managment/user/update_pass";
		var _this = this;
		$.ajax({
			type: "POST",
			url: url,
			data: {
				email: _this.model.get("email"),
			},
			headers: {
				[CSRF_KEY]: CSRF,
			},
			async: false,
			success: function(data){
				_this.message.html(data);
				_this.message.addClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.removeClass("color-error");
			},
			error: function(xhr, status, error){
				console.error(xhr.responseText);
				var m = JSON.parse(xhr.responseText);
				_this.message.html(m.mensaje[0]);
				_this.message.removeClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.addClass("color-error");
			}
		});
	},
	reenviarActivacion: function(event){
		// ajax
		var url = BASE_URL + "managment/user/resend_activation";
		var _this = this;
		$.ajax({
			type: "POST",
			url: url,
			data: {
				email: _this.model.get("email"),
				user_id: _this.model.get("user_id"),
			},
			headers: {
				[CSRF_KEY]: CSRF,
			},
			async: false,
			success: function(data){
				_this.message.html(data);
				_this.message.addClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.removeClass("color-error");
			},
			error: function(xhr, status, error){
				console.error(xhr.responseText);
				var m = JSON.parse(xhr.responseText);
				_this.message.html(m.mensaje[0]);
				_this.message.removeClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.addClass("color-error");
			}
		});
	},
	crearUsuario: function(event){
		var url = BASE_URL + "managment/user/create";
		var _this = this;
		$.ajax({
			type: "POST",
			url: url,
			data: {
			  usuario: $("#txtUsuarioNuevo").val(),
				correo: $("#txtCorreoNuevo").val(),
 			},
			headers: {
				[CSRF_KEY]: CSRF,
			},
			async: false,
			success: function(data){
				_this.message.html("Usuario creado");
				_this.message.addClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.removeClass("color-error");
			},
			error: function(xhr, status, error){
				console.error(xhr.responseText);
				var m = JSON.parse(xhr.responseText);
				if(m.mensaje[1] == "repeated"){
					_this.message.html("Usuario y/o correo ya se encuentran en uso");
				}else{
					_this.message.html(m.mensaje[0]);
				}
				_this.message.removeClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.addClass("color-error");
			}
		});
	},
	generarCorrelativo: function(event){
		var url = BASE_URL + "managment/user/correlation";
		var _this = this;
		$.ajax({
			type: "GET",
			url: url,
			data: { },
			headers: {
				[CSRF_KEY]: CSRF,
			},
			async: false,
			success: function(data){
				$("#txtUsuarioNuevo").val(data);
			},
			error: function(error){
				console.log(error);
				_this.message.removeClass("color-success");
				_this.message.removeClass("color-warning");
				_this.message.addClass("color-error");
				_this.message.html("Ocurrió un error en realizar la búsqueda");
			}
		});
	},
  showIndex: function(event){
		var template = _.template(`
			<div class="col-md-12">
				<h6>Buscar Usuarios</h6>
			</div>
			<div class="col-md-3">
		    <div class="form-group">
		      <label for="txtUsuario">Usuario</label>
		      <input type="text" class="form-control" id="txtUsuario" placeholder="Ingrese usuario a gestionar" value="">
					<br>
					<button id="btnBuscarUsuario" class="btn btn-default pull-right"><i class="fa fa-search" aria-hidden="true"></i>Buscar Usuario</button>
		    </div>
		  </div>
			<div class="col-md-3">
		    <div class="form-group">
		      <label for="cbmEstado">Estado de Usuario</label>
		      <select class="form-control" id="cbmEstado" disabled>
		        <option value="E"></option>
						<% for (var i = 0; i < states.length; i++){ %>
						<option value="<%= states[i]['id'] %>"><%= states[i]['name'] %></option>
						<% } %>
		      </select>
					<br>
					<button id="btnActualizarEstado" class="btn btn-default pull-right" disabled><i class="fa fa-check" aria-hidden="true"></i>Actualizar Estado</button>
		    </div>
		  </div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="txtCorreo">Correo del Usuario</label>
					<input type="text" class="form-control" id="txtCorreo" disabled placeholder="" value="">
					<br>
					<button id="btnActualizarCorreo" class="btn btn-default pull-right" disabled><i class="fa fa-check" aria-hidden="true"></i>Actualizar Correo</button>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="txtCorreo">Otras Accciones</label>
					<br>
					<button id="btnCambiarContrasenia" disabled class="btn btn-default pull-left"><i class="fa fa-repeat" aria-hidden="true"></i>Cambiar Contraseña</button>
					<br>
					<br>
					<button id="btnReenviarActivacion" disabled class="btn btn-default pull-left"><i class="fa fa-envelope" aria-hidden="true"></i>Reenviar Activación</button>
				</div>
			</div>
		`);
		$(this.el).html(template({states: this.states}));
  },
  showAdd: function(event){
		var template = _.template(`
			<div class="col-md-12">
				<h6>Agregar Usuario</h6>
			</div>
			<div class="col-md-3">
		    <div class="form-group">
		      <label for="txtUsuarioNuevo">Usuario</label>
		      <input type="text" class="form-control" id="txtUsuarioNuevo" placeholder="" disabled value="">
					<br>
					<button id="btnGenerarUsuario" class="btn btn-default pull-right"><i class="fa fa-search" aria-hidden="true"></i>Generar Nombre</button>
		    </div>
		  </div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="txtCorreoNuevo">Correo del Usuario</label>
					<input type="text" class="form-control" id="txtCorreoNuevo" placeholder="" value="">
					<br>
					<button id="btnCrearUsuario" class="btn btn-default pull-right"><i class="fa fa-check" aria-hidden="true"></i>Crear Usuario</button>
				</div>
			</div>
		`);
		$(this.el).html(template());
  },
});