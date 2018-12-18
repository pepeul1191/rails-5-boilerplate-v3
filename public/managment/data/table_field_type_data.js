var dataTablaFieldType = {
  el: "#formTableFieldType",
  idTable: "tablaFieldType",
  targetMensaje: "mensajeRptaFieldType",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/field_type/save",
  urlListar: BASE_URL + "managment/field_type/list",
  fila: {
    id: { // llave de REST
      tipo: "td_id",
      estilos: "color: blue; display:none",
      edicion: false,
    },
    name: { // llave de REST
      tipo: "text",
      estilos: "width: 200px;",
      edicion: true,
    },
    filaBotones: {
      estilos: "width: 80px; padding-left: 25px;"
    },
  },
  tableKeys: ['id', 'name'],
  filaBotones: [
    {
      tipo: "i",
      claseOperacion: "quitar-fila",
      clase: "fa-times",
      estilos: "padding-left: 10px;",
    },
  ],
  collection: new FieldTypeCollection(),
  model: "FieldType",
};

var dataTablaFieldFieldType = {
  el: "#formTableFieldType",
  idTable: "tablaFieldType",
  targetMensaje: "mensajeRptaFieldType",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/field/field_type/save",
  urlListar: BASE_URL + "managment/field/field_type/",
  fila: {
    id: { // llave de REST
      tipo: "td_id",
      estilos: "color: blue; display:none",
      edicion: false,
    },
    name: { // llave de REST
      tipo: "label",
      estilos: "width: 200px;",
      edicion: true,
    },
    existe: {
      tipo: "check",
      estilos: "width: 70px; padding-left:20px;",
      edicion: true,
      key: "existe",
    },
    filaBotones: {
      estilos: "width: 80px; padding-left: 7px; display:none;"
    },
  },
  tableKeys: ['id', 'name', 'existe'],
  filaBotones: [
  ],
  collection: new FieldTypeCollection(),
  model: "FieldType",
};
