function limpiarURL(url_original, parametro){
  return url_original + parametro;
}

var managmentRouter = Backbone.Router.extend({
  locationView: null,
  serviceView: null,
  fieldTypeView: null,
  clientDetailView: null,
  bankView: null,
  clientView: null,
  bannerView: null,
  initialize: function() {
  },
  routes: {
    "": "locationIndex",
    "location": "locationIndex",
    "service": "serviceIndex",
    "bank": "bankIndex",
    "field_type": "fieldTypeIndex",
    "client/add": "clientAdd",
    "client/edit/:client_id": "clientEdit",
    "client": "clientIndex",
    "banner": "bannerIndex",
    "*actions" : "default",
  },
  index: function(){
    window.location.href = BASE_URL + "accesos/#/modulo";
  },
  default: function() {
    //window.location.href = BASE_URL + "error/access/404";
  },
  //modulo
  locationIndex: function(){
    if(this.locationView == null){
      this.locationView = new LocationView();
    }
    this.locationView.render();
    this.locationView.tablaDepartment.listar();
    this.locationView.tablaDepartment.listar();
  },
  serviceIndex: function(){
    if(this.serviceView == null){
      this.serviceView = new ServiceView();
    }
    this.serviceView.render();
    this.serviceView.tablaService.listar();
  },
  bankIndex: function(){
    if(this.bankView == null){
      this.bankView = new BankView();
    }
    this.bankView.render();
    this.bankView.tablaBank.listar();
  },
  fieldTypeIndex: function(){
    if(this.fieldTypeView == null){
      this.fieldTypeView = new FieldTypeView();
    }
    this.fieldTypeView.render();
    this.fieldTypeView.tablaFieldType.listar();
  },
  clientAdd: function(){
    if(this.clientDetailView == null){
      this.clientDetailView = new ClientDetailView();
    }
    //setear datos de vista
    this.clientDetailView.llenarModelsSelect();
    this.clientDetailView.context.bank_id = "E";
    this.clientDetailView.context.banks = this.clientDetailView.bankSelect.toJSON();
    this.clientDetailView.context.client_state_id = "E";
    this.clientDetailView.context.clientStates = this.clientDetailView.clientStateSelect.toJSON();
    this.clientDetailView.client_id = "E";
    //render
    this.clientDetailView.render();
    this.clientDetailView.clearForms();
    //tablas
    this.clientDetailView.tablaPicture.urlListar = BASE_URL + "managment/picture/list/E";
    this.clientDetailView.tablaPicture.limpiarBody();
    this.clientDetailView.tablaService.urlListar = BASE_URL + "managment/client/service/E";
    this.clientDetailView.tablaService.limpiarBody();
    this.clientDetailView.tablaField.urlListar = BASE_URL + "managment/client/field/" + "E";
    this.clientDetailView.tablaField.limpiarBody();
  },
  clientIndex: function(){
    if(this.clientView == null){
      this.clientView = new ClientView();
    }
    this.clientView.render();
    this.clientView.tablaClient.listar();
  },
  clientEdit: function(client_id){
    if(this.clientDetailView == null){
      this.clientDetailView = new ClientDetailView();
    }
    this.clientDetailView.llenarModelsSelect();
    //setear model de client
    this.clientDetailView.setModel(client_id);
    this.clientDetailView.client.set({"id": client_id,});
    //setear datos de vista
    this.clientDetailView.context.client = this.clientDetailView.client.attributes;
    this.clientDetailView.context.bank_id = this.clientDetailView.client.get("bank_id");
    this.clientDetailView.context.district_id = this.clientDetailView.client.get("district_id");
    this.clientDetailView.context.banks = this.clientDetailView.bankSelect.toJSON();
    this.clientDetailView.context.client_state_id = this.clientDetailView.client.get("client_state_id");
    this.clientDetailView.context.clientStates = this.clientDetailView.clientStateSelect.toJSON();
    //setear model upload de logo
    this.clientDetailView.uploadLogo.model.set("file_url", this.clientDetailView.client.get("logo_url"));
    this.clientDetailView.uploadLogo.model.set("file_id", this.clientDetailView.client.get("file_id"));
    //setear model autocomplete de distritos
    this.clientDetailView.distritcAutocomplete.model = new District();
    this.clientDetailView.distritcAutocomplete.model.set("id", this.clientDetailView.client.get("district_id"));
    this.clientDetailView.distritcAutocomplete.model.set("name", this.clientDetailView.client.get("district"));
    //render
    this.clientDetailView.render();
    //tablas
    this.clientDetailView.tablaPicture.urlListar = BASE_URL + "managment/picture/list/" + client_id;
    this.clientDetailView.tablaPicture.listar();
    this.clientDetailView.tablaService.urlListar = BASE_URL + "managment/client/service/" + client_id;
    this.clientDetailView.tablaService.listar();
    this.clientDetailView.tablaField.urlListar = BASE_URL + "managment/client/field/" + client_id;
    this.clientDetailView.tablaField.listar();
    //cambiar titulo
    $("#title-form").html("Editar cliente");
  },
  bannerIndex: function(){
    if(this.BannerView == null){
      this.BannerView = new BannerView();
    }
    this.BannerView.render();
    this.BannerView.tablaBanner.listar();
  },
});

$(document).ready(function(){
  router = new managmentRouter();
  Backbone.history.start();
})
