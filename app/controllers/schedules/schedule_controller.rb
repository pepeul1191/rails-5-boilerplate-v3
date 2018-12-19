class Schedules::ScheduleController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      Schedules::Schedule.all.where(field_id: params[:field_id]).each do |test|
        puts test.to_json
      end
      rpta = ''
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

  def generate
    rpta = nil
    status = 200
    begin
      data = JSON.parse(params[:data])
      field_id = data['field_id']
      hour_init = data['hour_init'].to_i
      hour_end = data['hour_end'].to_i
      transaction = data['transaction']
      date_init_array = data['date_init'].split('/')
      date_end_array = data['date_end'].split('/')
      if transaction.length != 30 # edit
        transaction = random_string(30)
      end
      date_init = DateTime.new(date_init_array[2].to_i, date_init_array[1].to_i, date_init_array[0].to_i)
      date_end = DateTime.new(date_end_array[2].to_i, date_end_array[1].to_i, date_end_array[0].to_i)
      puts '1 +++++++++++++++++++++++++++++++++++++'
      s = Schedules::ScheduleHelper.create(date_init, field_id, hour_init, hour_end, transaction)
      puts '2 +++++++++++++++++++++++++++++++++++++'
      puts s.save
      puts '3 +++++++++++++++++++++++++++++++++++++'
    rescue Exception => e
      puts e.backtrace
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
end
