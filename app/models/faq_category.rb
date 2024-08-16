class FaqCategory < ApplicationRecord
  validates_presence_of :title
  translates :title
  has_many :faq, dependent: :destroy
end
