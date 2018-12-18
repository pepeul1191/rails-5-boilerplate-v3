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
end
