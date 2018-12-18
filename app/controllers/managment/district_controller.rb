class Managment::DistrictController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Managment::District.select(:id, :name, :latitude, :longitude).where(
          :province_id => params[:province_id]
        ).all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los distritos de la provincia',
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
    data = JSON.parse(params[:data])
    nuevos = data['nuevos']
    editados = data['editados']
    eliminados = data['eliminados']
    province_id = data['extra']['province_id']
    rpta = []
    array_nuevos = []
    error = false
    execption = nil
    DB_MANAGMNET.transaction do
      begin
        if nuevos.length != 0
          nuevos.each do |nuevo|
            n = Managment::District.new(
              :name => nuevo['name'],
              :latitude => nuevo['latitude'],
              :longitude => nuevo['longitude'],
              :province_id => province_id
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
            e = Managment::District.where(
              :id => editado['id'],
            ).first
            e.name = editado['name']
            e.latitude = editado['latitude']
            e.longitude = editado['longitude']
            e.save
          end
        end
        if eliminados.length != 0
          eliminados.each do |eliminado|
            Managment::District.where(
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
          'Se ha registrado los cambios en los distritos',
          array_nuevos
          ]
        }.to_json
    else
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en guardar la tabla de distritos',
          execption.message
          ]
        }.to_json
    end
    render :plain => rpta, :status => status
  end

  def search
		rpta = nil
		status = 200
		begin
			rpta = Managment::VWDistrict.where(
          Sequel.like(:name, params[:nombre] + '%')
        ).limit(10).to_a.to_json
		rescue Exception => e
			rpta = {
				:tipo_mensaje => 'error',
				:mensaje => [
					'Se ha producido un error en buscar coincidencias en los nombres de los distritos',
					e.message
				]
			}.to_json
			status = 500
		end
		render :plain => rpta, :status => status
	end

  	def name_by_id
		rpta = nil
		status = 200
		begin
			temp = Managment::VWDistrict.select(:name).where(
        :id => params[:district_id]).first
			rpta = temp.name
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
end
