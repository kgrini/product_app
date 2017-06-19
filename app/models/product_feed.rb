class ProductFeed < ActiveRecord::Base

  validates :title, :description, :affiliate_code, presence: true

  before_save :convert_currency_to_cents

  scope :visible, -> { where(deleted: false) }

  def convert_currency_to_cents
    self.price = self.price * 100
  end

  def currency_price
    price/100 if price
  end
end
