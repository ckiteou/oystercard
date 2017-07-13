class Station

  attr_reader :name, :zone
  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end

=begin
p angel = Station.new("Angel", "zone 1")
p angel.name
p angel.zone
=end
