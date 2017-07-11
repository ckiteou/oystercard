require 'oystercard'

describe Oystercard do
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

  describe "#educt" do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "can deduct from the balance" do
      subject.top_up(20)
      expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
    end
  end

  describe "#touch_in" do
    it { is_expected.to respond_to(:touch_in) }
  end

  describe "#touch_out" do
    it { is_expected.to respond_to(:touch_out) }
  end

  describe "#in_journey?" do
    it { is_expected.to respond_to(:in_journey?) }

    it 'is initially not in journey' do
      expect(subject).not_to be_in_journey
    end

    it "expects in_journey? to equal true if touch_in" do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end
end
