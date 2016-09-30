require 'docking_station'

describe DockingStation do

  it {is_expected.to respond_to (:bikes) }

  it { is_expected.to respond_to :release_bike}

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

  it 'returns docked bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'sets a defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Dock is full'
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

    it 'raises an error if someone tries to release a broken bike' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error("No bikes available")
    end

    it 'allows you to release a bike if one is available that\'s not broken' do
      broken_bike = Bike.new
      broken_bike.report_broken
      subject.dock(broken_bike)
      working_bike = Bike.new
      subject.dock(working_bike)
      expect(subject.release_bike).to eq working_bike
    end

  end

  describe "#dock" do
    it "raises an error when dock is full" do
      expect { (subject.capacity+1).times {subject.dock(Bike.new) } }.to raise_error("Dock is full")
    end

    it 'allow a broken bike to be docked' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(bike).to be_broken
    end


  end
end
