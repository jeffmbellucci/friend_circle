class PostShare < ActiveRecord::Base
  attr_accessible :circle_id, :post_id
  validates :circle_id, :post_id, presence: true

  belongs_to :post
  belongs_to :circle
end
