require 'van'

describe Van do
  let(:broken_bike) { double :bike, broken?: true }
  let(:broken_bike_array) { double [:bike1, :bike2, :bike3] }

  it 'collect a broken bike from docking station' do
    expect(subject.load(broken_bike)).to eq [broken_bike]
  end
  it 'collect all broken bikes from a docking station' do
    expect(subject.load(broken_bike_array)).to eq [broken_bike_array]
  end

  it 'van has a default capacity' do
    subject.load(broken_bike)
    subject.load(broken_bike)
    expect{subject.load(broken_bike)}.to raise_error "Van capacity has been reached"
  end

  it 'deliver a broken bike to the garage' do
    subject.load(broken_bike)
    expect(subject.unload).to eq []
  end
  it 'unloads all bikes to the garage' do
    subject.load(broken_bike)
    subject.load(broken_bike)
    expect(subject.unload).to eq []
  end
end
