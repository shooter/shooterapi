require 'spec_helper'

describe Listener do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :shortcode_url => "value for shortcode_url"
    }
  end

  it "should create a new instance given valid attributes" do
    Listener.create!(@valid_attributes)
  end
end
