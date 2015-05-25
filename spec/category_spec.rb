require 'spec_helper'

describe Category do

  it "can run tests" do
    expect(true).to eq(true)
  end

  it "can see the database" do
    expect(Category.all.length).to be >= (0)
  end

  it {should validate_presence_of(:name)}
end