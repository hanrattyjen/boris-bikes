require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike, broken?: false }
  let(:broken_bike) { double :bike, broken?: true }

  it {is_expected.to respond_to (:bikes) }
  it { is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'has a default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it 'allows user to set docking station capacity upon initialisation' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  it 'docks a working bike' do
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'returns the docked bike' do
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe 'initialization' do
    it 'sets a defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Dock is full'
    end
  end

  describe '#release_bike' do
    it 'releases working bikes' do
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).not_to be_broken
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error('No bikes available')
    end
    
    it 'raises an error if someone tries to release a broken bike' do
      subject.dock(broken_bike)
      expect {subject.release_bike}.to raise_error("No bikes available")
    end

    it 'allows you to release a bike if one is available that\'s not broken' do
      subject.dock(broken_bike)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

  end

  describe "#dock" do
    it "raises an error when dock is full" do
      expect { (subject.capacity+1).times {subject.dock(bike) } }.to raise_error("Dock is full")
    end

  end
end
