class ProductCategoryContent < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :product_category, :foreign_key => :id, :autosave=>true
  accepts_nested_attributes_for :product_category, :allow_destroy => true
end
