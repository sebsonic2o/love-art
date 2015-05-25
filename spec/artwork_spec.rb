require 'spec_helper'

describe Artwork do

  it "can run tests" do
    expect(true).to eq(true)
  end

  it "can see the database" do
    expect(Artwork.all.length).to be >= (0)
  end

  it {should validate_presence_of(:artist)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:image_url)}
end