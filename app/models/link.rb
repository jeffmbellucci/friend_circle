class Link < ActiveRecord::Base
  attr_accessible :link#, :post_id
  validates :link,  :presence => true
end
