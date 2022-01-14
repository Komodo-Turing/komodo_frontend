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
    @user_id = active_timer_data[:user]
    @name = active_timer_data[:name]
    @start_time = DateTime.now
    @duration = active_timer_data[:duration]
    @substance = active_timer_data[:substance]
    @dosage = active_timer_data[:dosage]
    @entry_instructions = active_timer_data[:entry_instructions]
    @notes = active_timer_data[:notes]
    @status = 'active'
  end
end
