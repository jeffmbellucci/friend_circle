class CircleMembership < ActiveRecord::Base
  attr_accessible :circle_id, :member_id

  belongs_to :circle
  belongs_to :member, class_name: "User"

end
