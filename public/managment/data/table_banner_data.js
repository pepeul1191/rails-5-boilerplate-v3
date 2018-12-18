var dataTablaBanner = {
  el: "#formTableBanner",
  idTable: "tablaBanner",
  targetMensaje: "mensajeRptaBanner",
  mensajes: {
    errorListarAjax: "Error en listar los datos del servidor",
    errorGuardarAjax: "Error en guardar los datos en el servidor",
    success: "Se cargado guardo los cambios en los autores",
  },
  urlGuardar: BASE_URL + "managment/banner/save",
  urlListar: BASE_URL + "managment/banner/list",
  fila: {
    id: { // llave de REST
      tipo: "td_id",
      estilos: "color: blue; display:none",
      edicion: false,
    },
    description: { // llave de REST
      tipo: "text",
      estilos: "width: 200px;",
      edicion: true,
    },
    filaBotones: {
      estilos: "width: 80px; padding-left: 25px;"
    },
  },
  fileServerUrl: 'http://localhost:3000/uploads/',
  tableKeys: ['id', 'description'],
  filaBotones: [
    {
      tipo: "i",
      claseOperacion: "seleccionar-archivo",
      clase: "fa-search",
      estilos: "padding-left: 7px;",
    },
    {
      tipo: "i",
      claseOperacion: "subir-archivo",
      clase: "fa-cloud-upload",
      estilos: "padding-left: 7px;",
    },
    {
      tipo: "i",
      claseOperacion: "ver-archivo",
      clase: "fa-picture-o",
      estilos: "padding-left: 7px;",
    },
    {
      tipo: "i",
      claseOperacion: "quitar-fila",
      clase: "fa-times",
      estilos: "padding-left: 7px;",
    },
  ],
  file: {
    input_file_id: "bannerFile",
    url: BASE_URL + "file/upload",
    max_size: 2, //mb
    formats: ["png", "jpg", "deb"],
    form_name: "file",
    method: "POST",
    model_attributes: ["id"],
    model_key: "url",
  },
  collection: new BannerCollection(),
  model: "Banner",
};
