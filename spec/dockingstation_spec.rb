require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "allows a bike to be docked" do
    bike = Bike.new
    expect(subject.dock(bike)).to include bike
  end
  it "get the bike from the docking station" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
  it "raises an error when releasing a bike when isn't docked" do
    expect{ subject.release_bike }.to raise_error "No bikes available"
  end
  it "expects trying to dock a bike to return an error, when 20 are already docked" do
    20.times { subject.dock(Bike.new) }
    expect{ subject.dock(Bike.new) }.to raise_error "There's already 20 bikes here"
  end
end

describe Bike do
  it "is it working?" do
    expect(subject.working?).to eq true
  end
end
