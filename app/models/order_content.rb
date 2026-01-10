class OrderContent < ActiveRecord::Base
  validates_presence_of :order
  belongs_to :order,  inverse_of: :order_content
end
