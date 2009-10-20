class Shooter < ActiveRecord::Base
  
  validates_presence_of :name
  
  has_many :mufflers
  has_many :webhooks
  belongs_to :user
  
  shortcode_url :length => 16
  
  def self.find(*args)
    if !args.many? and args.first.kind_of?(String) and !args.first.match(/^\d*$/)
      find_by_shortcode_url(args)
    else
      super(*args)
    end
  end
  
  def to_param
    shortcode_url
  end
  
  def shoot!
    webhooks.each do |webhook|
      RestClient.post(webhook.url, :payload => payload)
    end
    self.update_attribute(:payload, nil)
  end
  
  def add_payload(payload_contents)
    if payload.blank? and mufflers_allow(payload_contents)
      self.update_attribute(:payload, payload_contents)
      Notification.deliver_notification(self) if user
    else
      false
    end
  end
  
  def mufflers_allow(payload_contents)
    mufflers.each do |muffler|
      return false if payload_contents.to_s.match(Regexp.new(muffler.pattern))
    end
    true
  end
end
