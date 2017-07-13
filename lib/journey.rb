class Journey


  def initialize
    @current_journey = {}
    @journey_log = []
    @in_journey = false
  end

 def journey_start(entry_station)
   @current_journey[:entry_station] = entry_station
   @in_journey = true
   @current_journey
 end

 def journey_end(exit_station)
   @current_journey[:exit_station] = exit_station
   @in_journey = false
   @current_journey
 end

 def journey_log
   @journey_log << @current_journey
 end

 def in_journey?
   @in_journey
 end
end
