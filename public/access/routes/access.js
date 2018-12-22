function limpiarURL(url_original, parametro){
  return url_original + parametro;
}

var accessRouter = Backbone.Router.extend({
  moduloView: null,
  permissionView: null,
  roleView: null,
  systemView: null,
  initialize: function() {
  },
  routes: {
    "": "permissionIndex",
    "system" : "systemIndex",
    "permission" : "permissionIndex",
    "role" : "roleIndex",
    "*actions" : "default",
  },
  index: function(){
    //window.location.href = BASE_URL + "accesos/#/modulo";
  },
  default: function() {
    //window.location.href = BASE_URL + "error/access/404";
  },
  //system
  systemIndex: function(){
    if(this.systemView == null){
      this.systemView = new SystemView();
    }
    this.systemView.render();
    this.systemView.tableSystem.listar();
  },
  //permission
  permissionIndex: function(){
    if(this.permissionView == null){
      this.permissionView = new PermissionView();
    }
    this.permissionView.render();
    this.permissionView.tablePermission.listar();
  },
  //role
  roleIndex: function(){
    if(this.roleView == null){
      this.roleView = new RoleView();
    }
    this.roleView.render();
    this.roleView.tableRole.listar();
  },
});

$(document).ready(function(){
  router = new accessRouter();
  Backbone.history.start();
})
