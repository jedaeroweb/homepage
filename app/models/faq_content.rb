class FaqContent < ApplicationRecord
  validates_presence_of :content
  translates :content
  belongs_to :faq, :foreign_key => :id, inverse_of: :faq_content
end
