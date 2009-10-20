class Webhook < ActiveRecord::Base
  belongs_to :shooter
  url_field :url
end