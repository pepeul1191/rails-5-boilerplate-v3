var dataTablaClient = {
  el: "#formTableClient",
  idTable: "tablaClient",
  targetMensaje: "mensajeRptaClient",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlListar: BASE_URL + "managment/client/list",
  fila: {
    id: { // llave de REST
      tipo: "td_id",
      estilos: "color: blue; display:none",
      edicion: false,
    },
    name: { // llave de REST
      tipo: "label",
      estilos: "width: 100px;",
      edicion: true,
    },
    district: { // llave de REST
      tipo: "label",
      estilos: "width: 250px;",
      edicion: true,
    },
    address: { // llave de REST
      tipo: "label",
      estilos: "width: 200px;",
      edicion: true,
    },
    phone: { // llave de REST
      tipo: "label",
      estilos: "width: 100px;",
      edicion: true,
    },
    client_state: { // llave de REST
      tipo: "label",
      estilos: "width: 100px;",
      edicion: true,
    },
    filaBotones: {
      estilos: "width: 80px; padding-left: 25px;"
    },
  },
  tableKeys: ['id', 'name', 'district', 'address', 'phone', 'client_state'],
  filaBotones: [
    {
      tipo: "href",
      claseOperacion: "editar-detalle",
      clase: "fa-pencil",
      estilos: "padding-left: 7px;",
      url: BASE_URL + 'managment/#/client/edit/'/*+ libro_id*/,
    },
  ],
  collection: new ClientCollection(),
  model: "Client",
};
