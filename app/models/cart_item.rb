class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def with_tax_price
    (item.price*1.1).floor
  end
  def subtotal
    item.with_tax_price * amount
  end
  def get_image
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_cake.png')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
end

end
