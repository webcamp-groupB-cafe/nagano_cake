class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def with_tax_price
    (price*1.1).floor
  end
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_cake.jpg')
      image.attached(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
