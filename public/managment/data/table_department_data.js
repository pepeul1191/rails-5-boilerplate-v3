var dataTablaDepartment = {
  el: "#formTableDepartment",
  idTable: "tablaDepartment",
  targetMensaje: "mensajeRptaDepartment",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/department/save",
  urlListar: BASE_URL + "managment/department/list",
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
      claseOperacion: "provinces",
      clase: "fa-chevron-right",
      estilos: "padding-left: 17px;",
    },
    {
      tipo: "i",
      claseOperacion: "quitar-fila",
      clase: "fa-times",
      estilos: "padding-left: 10px;",
    },
  ],
  collection: new DepartmentCollection(),
  model: "Department",
};
