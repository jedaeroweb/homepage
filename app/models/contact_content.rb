class ContactContent < ApplicationRecord
  validates_presence_of :content
  belongs_to :contact, :foreign_key => :id, inverse_of: :contact_content
end
