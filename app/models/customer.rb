class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :items, through: :cart_items

  validates :first_name,presence: true
  validates :last_name,presence: true
  validates :kana_first_name,presence: true
  validates :kana_last_name,presence: true
  validates :email,presence: true #uniquness未記入
  validates :encrypted_password,presence: true
  validates :address,presence: true
  validates :postal_code,presence: true
  validates :phone_number,presence: true


  def active_for_authentication?
    super && (self.is_deleted == true)
  end

end
