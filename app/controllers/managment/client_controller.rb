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
end
