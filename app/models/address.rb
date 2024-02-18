class Address < ApplicationRecord
belongs_to :customer

def address_display
  '〒' + postal_code + ' ' + adress + ' ' + name
end

  validates :postal_code, presence: true
  validates :adress, presence: true
  validates :name, presence: true
end