class Post < ActiveRecord::Base
  attr_accessible :body, :owner_id, :title, :links_attributes, :circle_ids
  validates :owner_id, presence: true

  has_many :links
  has_many :post_shares
  has_many :circles, through: :post_shares

  accepts_nested_attributes_for :links, :reject_if => :all_blank
end
