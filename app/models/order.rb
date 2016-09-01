class Order < ApplicationRecord
  has_many :items, through: :ordered_items
  has_many :ordered_items
  belongs_to :user
  enum status: [:pendingpayment, :paid, :shipping, :delivered]
end
