
var dataTablaFieldSchedule = {
  el: "#formTableFieldSchedule",
  idTable: "tablaFieldSchedule",
  targetMensaje: "mensajeRptaFieldSchedule",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/field_schedule/save",
  urlListar: BASE_URL + "managment/field_schedule/list",
  fila: {
    _id: { // llave de REST
      tipo: "td_id",
      estilos: "color: blue; display:none",
      edicion: false,
    },
    hour_init: { // llave de REST
      tipo: "text",
      estilos: "width: 100px;",
      edicion: true,
    },
    hour_end: { // llave de REST
      tipo: "text",
      estilos: "width: 100px;",
      edicion: true,
    },
    date_init: { // llave de REST
      tipo: "text",
      estilos: "width: 150px;",
      edicion: true,
    },
    date_end: { // llave de REST
      tipo: "text",
      estilos: "width: 150px;",
      edicion: true,
    },
    filaBotones: {
      estilos: "width: 80px; padding-left: 25px;"
    },
  },
  tableKeys: ['_id', 'hour_init', 'hour_end','date_init', 'date_end'],
  filaBotones: [
    {
      tipo: "i",
      claseOperacion: "scheduleGenerate",
      clase: "fa-check",
      estilos: "padding-left: 10px;",
    },
    {
      tipo: "i",
      claseOperacion: "quitar-fila",
      clase: "fa-times",
      estilos: "padding-left: 10px;",
    },
  ],
  collection: new FieldScheduleCollection(),
  model: "FieldSchedule",
};
