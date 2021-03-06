require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up the balance" do
      expect{ subject.top_up 1}.to change{ subject.balance }.by 1
    end

    it "raises an error if the maximum balance is exceeded" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error 'Maximum balance of 20 exceeded'
    end
  end

  describe "#touch_in" do
    it { is_expected.to respond_to(:touch_in) }

    it "raises an error" do
      subject.balance < Oystercard::MINIMUM_BALANCE
      message = "Insufficient balance to touch in"
      expect{subject.touch_in(entry_station)}.to raise_error message
    end
  end

  describe "#touch_out" do
    it { is_expected.to respond_to(:touch_out) }
  end

  describe "#in_journey?" do
    it { is_expected.to respond_to(:in_journey?) }

    it 'is initially not in journey' do
      expect(subject).not_to be_in_journey
    end

    it 'during a journey it returns true' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end



    it "can touch out" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
=begin
      it 'has an empty list of journeys by default' do
      subject.top_up(10)
      expect(subject.journeys).to be_empty
    end
=end
    let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
    let(:journeys){ double :journeys }

    it 'stores a journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
  end
end
