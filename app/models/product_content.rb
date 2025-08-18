class ProductContent < ActiveRecord::Base
  validates_presence_of :product
  belongs_to :product,  inverse_of: :product_content
end
