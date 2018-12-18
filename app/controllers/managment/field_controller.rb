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

  def field_type_save
    data = JSON.parse(params[:data])
    editados = data['editados']
    field_id = data['extra']['field_id']
    rpta = []
    status = 200
    DB_MANAGMNET.transaction do
      begin
        if editados.length != 0
          editados.each do |editado|
            existe = editado['existe']
            field_type_id = editado['id']
            e = Managment::FieldFieldType.where(
              :field_type_id => field_type_id,
              :field_id => field_id
            ).first
            if existe == 0 #borrar si existe
              if e != nil
                e.delete
              end
            elsif existe == 1 #crear si no existe
              if e == nil
                n = Managment::FieldFieldType.new(
                  :field_type_id => field_type_id,
                  :field_id => field_id
                )
                n.save
              end
            end
          end
        end
        rpta = {
          :tipo_mensaje => 'success',
          :mensaje => [
            'Se ha registrado la asociación de tipos de canchas a la cancha',
          ]}
      rescue Exception => e
        Sequel::Rollback
        status = 500
        rpta = {
          :tipo_mensaje => 'error',
          :mensaje => [
            'Se ha producido un error en asociar los tipos de canchas a la cancha',
            e.message
          ]}
      end
    end
    render :plain => rpta.to_json, :status => status
  end
end
