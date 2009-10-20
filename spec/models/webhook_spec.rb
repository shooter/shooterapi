require 'spec_helper'

describe Webhook do
  before(:each) do
    @valid_attributes = {
      :url => "value for url",
      :shooter_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Webhook.create!(@valid_attributes)
  end
end
