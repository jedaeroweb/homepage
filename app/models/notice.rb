class Notice < ApplicationRecord
  is_impressionable
  acts_as_commentable
  acts_as_votable
  has_rich_text :content
  validates_presence_of :title
  has_one :notice_picture, dependent: :destroy
  accepts_nested_attributes_for :notice_picture, :allow_destroy => true
end
