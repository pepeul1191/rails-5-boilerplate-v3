var userRouter = Backbone.Router.extend({
  userView: null,
  initialize: function() {
    this.userView = new UserView();
  },
  routes: {
    "": "index",
    "add": "add",
    "*actions" : "default",
  },
  index: function(){
    this.userView.showIndex();
  },
  default: function() {
    //window.location.href = BASE_URL + "error/access/404";
  },
  //modulo
  add: function(){
    this.userView.showAdd();
  },
});

$(document).ready(function(){
  router = new userRouter();
  Backbone.history.start();
})
