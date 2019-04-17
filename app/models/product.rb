class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :p_name, presence: true
  validates :p_price, presence: true
  validates :p_description, presence: true
  validates :images, presence: true

  def serial_number
    "Dev-%.6d" % self.id
  end
end
