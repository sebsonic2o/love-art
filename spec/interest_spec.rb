require 'spec_helper'

describe Interest do

  it "can run tests" do
    expect(true).to eq(true)
  end

  it "can see the database" do
    expect(Interest.all.length).to be >= (0)
  end

  it {should validate_presence_of(:category)}
  it {should validate_presence_of(:lover)}
end