class ProductCategory < ApplicationRecord
  validates_presence_of :title
  has_many :products, dependent: :destroy

  has_one :product_category_content, :foreign_key => :id, :dependent => :destroy, inverse_of: :product_category
  accepts_nested_attributes_for :product_category_content, :allow_destroy => true

  def product_category_content
    super || build_product_category_content
  end
end
