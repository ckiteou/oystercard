require 'journey'

describe Journey do
 it{is_expected.to respond_to(:journey_start)}
 let(:kings_cross) { double :station}
 let(:angel) { double :station}

 describe '#current_journey' do

   it 'takes a value' do
     expect(subject.journey_start(kings_cross)).to eq({:entry_station => kings_cross})
   end

   it 'takes a value' do
     expect(subject.journey_end(kings_cross)).to eq({:exit_station => kings_cross})
   end
 end

 describe '#journey_log' do

   it{is_expected.to respond_to(:journey_log)}
   it 'records the journey' do
   journey = Journey.new

   journey.journey_start(kings_cross)
   journey.journey_end(angel)
   expect(journey.journey_log).to eq([{:entry_station => kings_cross, :exit_station => angel}])
    end
 end

 describe '#in_journey' do
   it {is_expected.to respond_to(:in_journey?)}

   it 'is initially set to false' do
     expect(subject.in_journey?).to eq false
   end

   it 'is expected to return true if during a journey' do
     journey = Journey.new
     journey.journey_start(kings_cross)
     expect(journey.in_journey?).to eq true
   end

   it 'is exprected to return false if not in journey' do
     journey = Journey.new
     journey.journey_start(kings_cross)
     journey.journey_end(angel)
     expect(journey.in_journey?).to eq false
   end
 end
end
