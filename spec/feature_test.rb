class Oystercard

  MAXIMUM_BALANCE = 20
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 3
  attr_reader :balance, :in_journey
  attr_accessor :entry_station

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @entry_station = "Oxford Circus"
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
    @entry_station = nil
  end

  def in_journey?
    @in_journey
  end

private
  def deduct(amount)
    @balance -= amount
  end
end

p oystercard = Oystercard.new
p oystercard.top_up(20)
p oystercard.in_journey?
  oystercard.touch_in("Oxford Station")
p oystercard.entry_station
p oystercard.in_journey?
  oystercard.touch_out
p oystercard.entry_station
p oystercard.in_journey?
