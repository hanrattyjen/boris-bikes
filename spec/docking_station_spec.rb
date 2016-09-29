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
      
      expect { (DockingStation::DEFAULT_CAPACITY+1).times {subject.dock(Bike.new) } }.to raise_error("Dock is full")
    end

  end
end
