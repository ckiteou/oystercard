
require_relative 'station'

class Oystercard

  MAXIMUM_BALANCE = 20
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 3
  attr_reader :balance, :in_journey
  attr_accessor :journeys, :exit_station, :entry_station

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
    @journey = Hash.new
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @journey[:entry_station] = entry_station
    @in_journey = true
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @in_journey = false
    @journey[:exit_station] = exit_station
    @journeys << @journey
  end

  def in_journey?
    @in_journey
  end

  def journeys
    @journeys
  end

private
  def deduct(amount)
    @balance -= amount
  end
end
