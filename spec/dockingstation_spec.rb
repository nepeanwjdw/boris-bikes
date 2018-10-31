require "dockingstation"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it "allows a bike to be docked" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
  it "get the bike from the docking station" do 
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
end
  
describe Bike do
  it "is it working?" do
    expect(subject.working?).to eq true
  end
end