require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "allows a bike to be docked" do
    bike = double(:bike)
    expect(subject.dock(bike)).to include bike
  end
  it "get the bike from the docking station" do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
  it "raises an error when releasing a bike when isn't docked" do
    expect{ subject.release_bike }.to raise_error "No bikes available"
  end
  it "expects trying to dock a bike to return an error, when 20 are already docked" do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
    expect{ subject.dock(double(:bike)) }.to raise_error "There's already 20 bikes here"
  end

  it 'accepts and argument which allows you to set a bespoke capacity' do
    bespoke_capacity = 10
    docking_station = DockingStation.new(bespoke_capacity)
    expect(docking_station.capacity).to eq(bespoke_capacity)
  end

  it 'should revert to DEFAULT_CAPACITY if no bespoke capacity is given' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'should allow a bike to report to be broken when docked' do
    bike = double(:bike)
    docking_station = DockingStation.new
    expect{ docking_station.dock(bike, true) }.to_not raise_error
  end

  it 'should not allow a bike to be released if broken' do
    docking_station = DockingStation.new
    docking_station.dock(double(:bike), true)
    expect(docking_station.release_bike).to eq "This bike is broken"
  end

end

describe Bike do
  it "is it working?" do
    expect(subject.working?).to eq true
  end
end
