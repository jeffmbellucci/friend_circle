class Circle < ActiveRecord::Base
  attr_accessible :owner_id, :member_ids, :title
  has_many :circle_memberships
  validates :owner_id, :title, presence: true

  has_many :members, through: :circle_memberships, source: :member
  belongs_to :owner,
              class_name: "User",
              foreign_key: :owner_id,
              primary_key: :id

  # accepts_nested_attributes_for :circle_memberships
end
