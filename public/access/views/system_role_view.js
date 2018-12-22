var SystemRoleView = ModalView.extend({
  initialize: function(options){
    this.targetMensaje = options["targetMensaje"];
    // herencia de atributos, móetodos y eventos
    ModalView.prototype.initialize.apply(this, [options])
    this.inheritEvents(ModalView);
    // delegación de eventos
    this.delegateEvents();
    this.tableRole = new TableView(dataTableRole);
    //this.tableRolePermission = new TableView(dataTablaRolePermission);
  },
  events: {
    // se está usando asignacion dinamica de eventos en el constructor
    // table roles
    "click #tableRole > tfoot > tr > td > button.agregar-fila": "agregarFilaRole",
		"click #tableRole > tfoot > tr > td > button.guardar-table": "guardarTablaRole",
		"keyup #tableRole > tbody > tr > td > input.text": "inputTextEscribirRole",
    "click #tableRole > tbody > tr > td > i.quitar-fila": "quitarFilaRole",
    "click #tableRole > tbody > tr > td > i.ver-permisos": "verPermissions",
    // table permisos
    "change #tableRolePermission > tbody > tr > td > .input-check": "clickCheckBoxRolePermission",
    "click #tableRolePermission > tfoot > tr > td > button.guardar-table": "guardarTablaRolePermission",
  },
  //eventos table de roles
  inputTextEscribirRole: function(event){
    this.tableRole.inputTextEscribir(event);
  },
  quitarFilaRole: function(event){
    this.tableRole.quitarFila(event);
  },
  guardarTablaRole: function(event){
    this.tableRole.extraData = {system_id: this.systemId};
    this.tableRole.guardarTabla(event);
  },
  agregarFilaRole: function(event){
    this.tableRole.agregarFila(event);
  },
  verPermissions: function(event){
    var roleId = event.target.parentElement.parentElement.firstChild.innerHTML;
    this.tableRolePermission.urlListar =
      limpiarURL(BASE_URL + "access/role/permission/list/" , this.tableRolePermission.sistemaId + "/" + roleId);
    this.tableRolePermission.roleId = roleId;
    this.tableRolePermission.limpiarBody();
    this.tableRolePermission.listar();
    $("#formTableRolePermission").removeClass("oculto");
  },
  //eventos table de permisos
  clickCheckBoxRolePermission: function(event){
    this.tableRolePermission.clickCheckBox(event);
  },
  guardarTablaRolePermission: function(evnet){
    this.tableRolePermission.extraData = {
      system_id: this.sistemaId,
      role_id: this.tableRolePermission.roleId,
    };
    this.tableRolePermission.guardarTabla(event);
  },
});
