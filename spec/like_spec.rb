require 'spec_helper'

describe Like do

  it "can run tests" do
    expect(true).to eq(true)
  end

  it "can see the database" do
    expect(Like.all.length).to be >= (0)
  end

  it {should validate_presence_of(:artwork)}
  it {should validate_presence_of(:lover)}
end