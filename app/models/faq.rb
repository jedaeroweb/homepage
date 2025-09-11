class Faq < ApplicationRecord
  has_rich_text :content
  validates_presence_of :title
  translates :title
  belongs_to :faq_category, counter_cache: true
end
