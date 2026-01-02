class Order < ApplicationRecord
  after_initialize :default_values

  validates_presence_of :user_id,:price,:discount,:payment
  validates :title,
            presence: true,
            length: {
              maximum: 60,
              too_long: "제목은 60자 이내여야 합니다."
            }
  belongs_to :user, counter_cache: true
  has_many :accounts_orders, dependent: :destroy
  has_many :orders_products, dependent: :destroy
  has_many :products, :through => :orders_products
  has_many :accounts, :through => :accounts_orders

  private

  def default_values
    self.transaction_date ||= Date.today
  end
end
