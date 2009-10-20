require 'spec_helper'

describe Muffler do
  before(:each) do
    @valid_attributes = {
      :pattern => "value for pattern",
      :shooter_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Muffler.create!(@valid_attributes)
  end
end
