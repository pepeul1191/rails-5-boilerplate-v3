var dataTablaClientField = {
  el: "#formTableClientField",
  idTable: "tablaClientField",
  targetMensaje: "mensajeRptaClientField",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/client/field/save",
  urlListar: BASE_URL + "managment/client/field/",
  fila: {
    id: { // llave de REST
      tipo: "td_id",
      estilos: "color: blue; display:none",
      edicion: false,
    },
    name: { // llave de REST
      tipo: "text",
      estilos: "width: 150px;",
      edicion: true,
    },
    hour_cost: { // llave de REST
      tipo: "text",
      estilos: "width: 80px;",
      edicion: true,
    },
    filaBotones: {
      estilos: "width: 80px; padding-left: 7px;"
    },
  },
  tableKeys: ['id', 'name', 'hour_cost'],
  filaBotones: [
    {
      tipo: "i",
      claseOperacion: "fieldType",
      clase: "fa-chevron-right",
      estilos: "padding-left: 7px;",
    },
    {
      tipo: "i",
      claseOperacion: "fieldSchedule",
      clase: "fa-calendar",
      estilos: "padding-left: 7px;",
    },
    {
      tipo: "i",
      claseOperacion: "quitar-fila",
      clase: "fa-times",
      estilos: "padding-left: 7px;",
    },
  ],
  collection: new FieldCollection(),
  model: "Field",
};
