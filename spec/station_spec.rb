require 'station'

describe Station do

  subject(:old_street) {described_class.new("Old Street", 1)}

  it 'knows its name' do
    expect(old_street.name).to eq("Old Street")
  end

  it 'knows its zone' do
    expect(old_street.zone).to eq(1)
  end
end
