class Contact < ApplicationRecord
  validates_presence_of :title, :email, :name
  validates :contact_content, :presence => true
  belongs_to :user, counter_cache: true, optional: true

  has_one :contact_content, :foreign_key => :id, :dependent => :destroy, inverse_of: :contact
  validates :contact_content, :presence => true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  accepts_nested_attributes_for :contact_content, :allow_destroy => true, :update_only => true

  def contact_content
    super || build_contact_content
  end
end
