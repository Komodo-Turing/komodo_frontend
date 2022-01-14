class ActiveTimer
  attr_reader :id,
              :user_id,
              :name,
              :start_time,
              :duration,
              :substance,
              :dosage,
              :entry_instructions,
              :notes,
              :status

  def initialize(active_timer_data)
    @id = active_timer_data[:id]
    @user_id = active_timer_data[:attributes][:user]
    @name = active_timer_data[:attributes][:name]
    @start_time = DateTime.now
    @duration = active_timer_data[:attributes][:duration]
    @substance = active_timer_data[:attributes][:substance]
    @dosage = active_timer_data[:attributes][:dosage]
    @entry_instructions = active_timer_data[:attributes][:entry_instructions]
    @notes = active_timer_data[:attributes][:notes]
    @status = 'active'
  end
end
