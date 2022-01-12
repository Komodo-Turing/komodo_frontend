class Timer

  attr_reader :id,
              :name,
              :duration,
              :substance,
              :dosage,
              :entry_instructions,
              :notes

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @duration = data[:attributes][:duration]
    @substance = data[:attributes][:substance]
    @dosage = data[:attributes][:dosage]
    @entry_instructions = data[:attributes][:entry_instructions]
    @notes = data[:attributes][:notes]
  end
end
