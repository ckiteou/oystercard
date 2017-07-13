=begin
class Oystercard

  MAXIMUM_BALANCE = 20
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 3
  attr_reader :balance, :in_journey, :station_log
  attr_accessor :entry_station, :exit_station
  def initialize
    @balance = 0
    @in_journey = false
    @entry_station
    @exit_station
    @station_log = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @entry_station = station
    @in_journey = true
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    @in_journey = false
  end

  def in_journey?
   @in_journey
  end

  def station_log
    @station_log << {entry_station: entry_station, exit_station: exit_station}

  end
private
  def deduct(amount)
    @balance -= amount
    @in_journey = false
  end
end

p oystercard = Oystercard.new
p oystercard.top_up(20)
p oystercard.in_journey?
  angel = Station.new("angel", 1)
p oystercard.touch_in(angel)
p oystercard.in_journey?
  holborn = Station.new("Holborn", 1)
p oystercard.touch_out(holborn)
p oystercard.in_journey?
p oystercard.journeys
p oystercard.in_journey?
  angel = Station.new("angel", 1)
p oystercard.touch_in(angel)
p oystercard.in_journey?
  holborn = Station.new("Holborn", 1)
p oystercard.touch_out(holborn)
p oystercard.in_journey?
p oystercard.journeys

=end
