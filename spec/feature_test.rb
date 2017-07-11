=begin
require './lib/oystercard.rb'
p oystercard = Oystercard.new
p oystercard.top_up(20)
p oystercard.touch_in
p oystercard.balance
p oystercard.touch_out
p oystercard.balance
p oystercard.in_journey?
=end
