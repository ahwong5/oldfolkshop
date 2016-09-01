class Item < ApplicationRecord
  belongs_to :category
  has_many :orders, through: :ordered_items
  has_many :ordered_items
  validates :name, presence: true,
                   length: { minimum: 3 }
  validates :description, presence: true,
                          length: { minimum: 10 }
  validates :price, presence: true
  enum status: [:active, :sale, :inactive]
end
