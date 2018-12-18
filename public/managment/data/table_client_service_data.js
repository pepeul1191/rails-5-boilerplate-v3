var dataTablaClientService = {
  el: "#formTableClientService",
  idTable: "tablaClientService",
  targetMensaje: "mensajeRptaClientService",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/client/service/save",
  urlListar: BASE_URL + "managment/client/service/",
  fila: {
    id: { // llave de REST
      tipo: "td_id",
      estilos: "color: blue; display:none",
      edicion: false,
    },
    name: { // llave de REST
      tipo: "label",
      estilos: "width: 150px;",
      edicion: true,
    },
    existe: {
      tipo: "check",
      estilos: "width: 70px; padding-left:20px;",
      edicion: true,
      key: "existe",
    },
    filaBotones: {
      estilos: "display: none;"
    },
  },
  tableKeys: ['id', 'name', 'existe'],
  filaBotones: [
  ],
  collection: new ServiceCollection(),
  model: "Service",
};
