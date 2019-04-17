class Comment < ApplicationRecord
  validates :c_description, presence: true, allow_blank: false
  belongs_to :user
  belongs_to :product
  default_scope -> { order(updated_at: :desc)}
end
