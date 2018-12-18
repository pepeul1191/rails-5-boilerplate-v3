var dataTablaProvince = {
  el: "#formTableProvince",
  idTable: "tablaProvince",
  targetMensaje: "mensajeRptaProvince",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/province/save",
  urlListar: BASE_URL + "managment/province/list",
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
    filaBotones: {
      estilos: "width: 80px; padding-left: 7px;"
    },
  },
  tableKeys: ['id', 'name'],
  filaBotones: [
    {
      tipo: "i",
      claseOperacion: "districts",
      clase: "fa-chevron-right",
      estilos: "padding-left: 7px;",
    },
    {
      tipo: "i",
      claseOperacion: "quitar-fila",
      clase: "fa-times",
      estilos: "padding-left: 10px;",
    },
  ],
  collection: new ProvinceCollection(),
  model: "Province",
};
