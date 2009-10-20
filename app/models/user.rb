class User < ActiveRecord::Base
  
  has_many :shooters do 
    def find(*args)
      if !args.many? and args.first.kind_of?(String) and !args.first.match(/^\d*$/)
        find_by_shortcode_url(args)
      else
        super(*args)
      end
    end
  end
  
  acts_as_authentic do |config|
    config.require_password_confirmation false
  end
end
