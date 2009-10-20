require 'spec_helper'

describe Shooter do
  
  before do
    @user = User.make
    @shooter = Shooter.make(:payload => nil, :user => @user)
  end
  
  describe "#shoot" do
    
    it "should shoot the payload away" do
      @shooter.update_attribute(:payload, 'a payload')
      @shooter.payload.should == 'a payload'
      @shooter.shoot!
      @shooter.payload.should be_nil
    end
    
  end
  
  describe "#add_payload" do
    
    context "in normal circumstances" do
    
      it "should add the payload if there is none" do
        Notification.should_receive(:deliver_notification).with(@shooter)
        @shooter.add_payload('bananas')
        @shooter.payload.should == 'bananas'
      end
    
      it "should not accept the payload if it matches a text filter" do
        @shooter.mufflers << Muffler.create(:pattern => 'monkeys')
        @shooter.add_payload('monkeys').should be_false
        @shooter.payload.should be_nil
      end
  
      it "should not accept the payload if it matches a Regex filter" do
        @shooter.mufflers << Muffler.create(:pattern => 'mon.eys')
        @shooter.add_payload('monkeys').should be_false
        @shooter.payload.should be_nil
      end
    
    end
    
    context "with a web hook" do
      
      before do
        @shooter.webhooks << Webhook.make(:url => 'http://www.webhook.com')
      end
      
      it "should post the payload to the webhook" do
        RestClient.should_receive(:post).with('http://www.webhook.com', :payload => 'a payload')
        @shooter.update_attribute(:payload, 'a payload')
        @shooter.shoot!
      end
      
    end

  end
  
end