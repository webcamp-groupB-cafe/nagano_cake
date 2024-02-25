class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :timeoutable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy



#退会ずみのユーザーが同じアカウントでログイン出来ないようにする記述
  def active_for_authentication?
    super && (is_active == true)
  end

  #部分一致検索
  def self.looks(search, word)
    if search == "partial"
  @customer = Customer.where("first_name LIKE ? OR last_name LIKE ?", "%#{word}%", "%#{word}%")
                   .or(Customer.where("CONCAT(first_name,last_name) LIKE ?", "%#{word}%"))
    end
  end

end
