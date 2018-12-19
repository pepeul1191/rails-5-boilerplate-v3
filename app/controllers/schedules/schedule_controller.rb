class Schedules::ScheduleController < ApplicationController
  def generate
    rpta = nil
    status = 200
    begin
      data = JSON.parse(params[:data])
      field_id = data['field_id'].to_i
      hour_init = data['hour_init'].to_i
      hour_end = data['hour_end'].to_i
      transaction = data['transaction']
      date_init_array = data['date_init'].split('/')
      date_end_array = data['date_end'].split('/')
      date_init = DateTime.new(date_init_array[2].to_i, date_init_array[1].to_i, date_init_array[0].to_i)
      date_end = DateTime.new(date_end_array[2].to_i, date_end_array[1].to_i, date_end_array[0].to_i)
      if hour_init < hour_end
        if date_init < date_end
          date_temp = DateTime.new(date_init.year, date_init.month, date_init.day)
          if transaction.length != 30 # create, else edit
            transaction = random_string(30)
            schedules = []
            while date_end >= date_temp do
              s = Schedules::ScheduleHelper.create(date_temp, field_id, hour_init, hour_end, transaction)
              schedules.push(s.as_document)
              date_temp = date_temp.next_day(1)
            end
            Schedules::Schedule.collection.insert_many(schedules)
            rpta = {
              :tipo_mensaje => 'success',
              :mensaje => [
                'Se ha creado un nuevo calendario',
                transaction
              ]
            }.to_json
          else
            #validate if schedule exist between dates to continues, else error
            pipeline = Schedules::ScheduleHelper.pipeline_check_calendar_in_range(field_id, date_init, date_end)
            in_range = JSON.parse(Schedules::Schedule.collection.aggregate(pipeline).to_json)
            if in_range != []
              Schedules::Schedule.delete_all({
                :transaction => transaction
              })
              schedules = []
              while date_end >= date_temp do
                s = Schedules::ScheduleHelper.create(date_temp, field_id, hour_init, hour_end, transaction)
                schedules.push(s.as_document)
                date_temp = date_temp.next_day(1)
              end
              Schedules::Schedule.collection.insert_many(schedules)
              rpta = {
                :tipo_mensaje => 'success',
                :mensaje => [
                  'Se ha editado un calendario',
                  transaction
                ]
              }.to_json
            end
          end
        else
          raise Exception, 'Hora de inicio tiene que ser menor que hora de fin.'
        end
      else
        raise Exception, 'Fecha de inicio tiene que ser menor que fecha de fin.'
      end
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en generar el calendario',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end

  def list_by_field_id
    rpta = nil
    status = 200
    begin
      field_id = params[:field_id].to_i
      pipeline = Schedules::ScheduleHelper.pipeline_managment_schedule_list_by_field_id(field_id)
      rpta = Schedules::Schedule.collection.aggregate(pipeline).to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los calendarios',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end

  def delete
    rpta = nil
    status = 200
    begin
      transaction_id = params[:transaction_id]
      #validate if schedule not have a reservation to continues, else error
      pipeline = Schedules::ScheduleHelper.pipeline_check_reservations(transaction_id)
      reservations = Schedules::Schedule.collection.aggregate(pipeline).count
      if reservations == 0
        Schedules::Schedule.delete_all({
          :transaction => transaction_id
        })
      else
        raise Exception, 'Calendario a borrar ya tiene una reservación realizada'
      end
      rpta = {
				:tipo_mensaje => 'success',
				:mensaje => [
					'Se ha eliminado el calendario',
				]
			}.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los calendarios',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end
end
