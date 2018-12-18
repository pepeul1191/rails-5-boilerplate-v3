var dataTablaDistrict = {
  el: "#formTableDistrict",
  idTable: "tablaDistrict",
  targetMensaje: "mensajeRptaDistrict",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/district/save",
  urlListar: BASE_URL + "managment/district/list",
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
    latitude: { // llave de REST
      tipo: "text",
      estilos: "width: 100px;",
      edicion: true,
    },
    longitude: { // llave de REST
      tipo: "text",
      estilos: "width: 100px;",
      edicion: true,
    },
    filaBotones: {
      estilos: "width: 80px; padding-left: 10px;"
    },
  },
  tableKeys: ['id', 'name', 'latitude', 'longitude'],
  filaBotones: [
    {
      tipo: "i",
      claseOperacion: "quitar-fila",
      clase: "fa-times",
      estilos: "padding-left: 10px;",
    },
  ],
  collection: new DistrictCollection(),
  model: "District",
};
