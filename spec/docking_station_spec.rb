require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike}

#release_bike returns a new instance of the Bike class
#a) gets a bike, and then b) expects the bike to be working

#it 'release a bike' do
#    bike = subject.release_bike
#    expect(bike).to be_working
#end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'allows user to set docking station capacity upon initialisation' do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  it 'sets the capacity to 20 if none is specified' do
    station = DockingStation.new
    expect(station.capacity).to eq 20
  end

  it 'bike is docked' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it {is_expected.to respond_to (:bikes) }

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(:bike)
      end
      expect{ subject.dock(:bike) }.to raise_error 'Dock is full'
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      expect(bike).to be_working
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error('No bikes available')
    end
  end

  describe "#dock" do
    it "raises an error when dock is full" do
      expect { (subject.capacity+1).times {subject.dock(Bike.new) } }.to raise_error("Dock is full")
    end

  end
end
