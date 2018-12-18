class Managment::FieldController < ApplicationController
  def field_type_list
    rpta = []
    status = 200
    begin
      rpta = DB_MANAGMNET.fetch('
        SELECT T.id AS id, T.name AS name, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe FROM
        (
          SELECT id, name, 0 AS existe FROM field_types
        ) T
        LEFT JOIN
        (
          SELECT T.id, T.name, 1 AS existe
          FROM fields_field_types FT
          INNER JOIN fields F ON FT.field_id = F.id
          INNER JOIN field_types T ON FT.field_type_id = T.id
          WHERE FT.field_id = ' + params[:field_id] + '
        ) P
        ON T.id = P.id;').to_a.to_json
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los tipos de chancas',
          e.message
        ]}
    end
    render :plain => rpta, :status => status
  end
end
