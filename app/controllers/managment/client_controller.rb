class Managment::ClientController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Managment::VWClientDistrictState.all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los clientes',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end

  def save
    rpta = nil
    status = 200
    begin
      data = JSON.parse(params[:data])
      if data['id'] == 'E' # crear
        n = Managment::Client.new(
          :name => data['name'],
          :address => data['address'],
          :logo_url => data['logo_url'],
          :description => data['description'],
          :latitude => data['latitude'],
          :longitude => data['longitude'],
          :account => data['account'],
          :phone => data['phone'],
          :district_id => data['district_id'],
          :client_state_id => data['client_state_id'],
          :bank_id => data['bank_id'],
        )
        n.save
        rpta = n.id
      else # editar
        e = Managment::Client.where(
          :id => data['id'],
        ).first
        e.name = data['name']
        e.address = data['address']
        e.logo_url = data['logo_url']
        e.description = data['description']
        e.latitude = data['latitude']
        e.longitude = data['longitude']
        e.account = data['account']
        e.phone = data['phone']
        e.district_id = data['district_id']
        e.client_state_id = data['client_state_id']
        e.bank_id = data['bank_id']
        e.save
      end
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en guardar al cliente',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end

  def get
    rpta = nil
		status = 200
		begin
			rpta = Managment::VWClientDistrictState.where(
        :id => params[:client_id]).first.to_json
		rescue Exception => e
			rpta = {
				:tipo_mensaje => 'error',
				:mensaje => [
					'Se ha producido un error en buscar el nombre del distrito',
					e.message
				]
			}.to_json
			status = 500
		end
		render :plain => rpta, :status => status
  end

  def service_list
    rpta = []
    status = 200
    begin
      rpta = DB_MANAGMNET.fetch('
        SELECT T.id AS id, T.name AS name, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe FROM
        (
          SELECT id, name, 0 AS existe FROM services
        ) T
        LEFT JOIN
        (
          SELECT S.id, S.name AS name, 1 AS existe
          FROM clients_services CS
          INNER JOIN services S ON CS.service_id = S.id
          WHERE CS.client_id = ' + params[:client_id] + '
        ) P
        ON T.id = P.id;').to_a.to_json
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los servicios del cliente',
          e.message
        ]}
    end
    render :plain => rpta, :status => status
  end

  def service_save
    data = JSON.parse(params[:data])
    editados = data['editados']
    client_id = data['extra']['client_id']
    rpta = []
    status = 200
    DB_MANAGMNET.transaction do
      begin
        if editados.length != 0
          editados.each do |editado|
            existe = editado['existe']
            service_id = editado['id']
            e = Managment::ClientService.where(
              :service_id => service_id,
              :client_id => client_id
            ).first
            if existe == 0 #borrar si existe
              if e != nil
                e.delete
              end
            elsif existe == 1 #crear si no existe
              if e == nil
                n = Managment::ClientService.new(
                  :service_id => service_id,
                  :client_id => client_id
                )
                n.save
              end
            end
          end
        end
        rpta = {
          :tipo_mensaje => 'success',
          :mensaje => [
            'Se ha registrado la asociación de servicios al cliente',
          ]}
      rescue Exception => e
        Sequel::Rollback
        status = 500
        rpta = {
          :tipo_mensaje => 'error',
          :mensaje => [
            'Se ha producido un error en asociar los servicios al cliente',
            e.message
          ]}
      end
    end
    render :plain => rpta.to_json, :status => status
  end

  def field_list
    rpta = nil
    status = 200
    begin
      rpta = Managment::Field.where(
          :client_id => params[:client_id]
        ).all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar las canchas del cliente',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end

  def field_save
    rpta = nil
    status = 200
    data = JSON.parse(params[:data])
    nuevos = data['nuevos']
    editados = data['editados']
    eliminados = data['eliminados']
    client_id = data['extra']['client_id']
    rpta = []
    array_nuevos = []
    error = false
    execption = nil
    DB_MANAGMNET.transaction do
      begin
        if nuevos.length != 0
          nuevos.each do |nuevo|
            n = Managment::Field.new(
              :name => nuevo['name'],
              :hour_cost => nuevo['hour_cost'],
              :client_id => client_id
            )
            n.save
            t = {
              :temporal => nuevo['id'],
              :nuevo_id => n.id
            }
            array_nuevos.push(t)
          end
        end
        if editados.length != 0
          editados.each do |editado|
            e = Managment::Field.where(
              :id => editado['id']
            ).first
            e.name = editado['name']
            e.hour_cost = editado['hour_cost']
            e.save
          end
        end
        if eliminados.length != 0
          eliminados.each do |eliminado|
            Managment::Field.where(
              :id => eliminado
            ).delete
          end
        end
      rescue Exception => e
        Sequel::Rollback
        error = true
        execption = e
      end
    end
    if error == false
      rpta = {
        :tipo_mensaje => 'success',
        :mensaje => [
          'Se ha registrado los cambios en las canchas',
          array_nuevos
          ]
        }.to_json
    else
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en guardar la tabla de canchas',
          execption.message
          ]
        }.to_json
    end
    render :plain => rpta, :status => status
  end
end
