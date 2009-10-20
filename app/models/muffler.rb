class Muffler < ActiveRecord::Base
  
  validates_presence_of :pattern
  
  belongs_to :shooter
end
