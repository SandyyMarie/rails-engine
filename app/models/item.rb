class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price
  validates :unit_price, numericality: true

  belongs_to :merchant
end