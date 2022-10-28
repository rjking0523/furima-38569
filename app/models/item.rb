class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  with_options presence: { message: "can't be blank" } do
    validates :image
    validates :name
    validates :content
    validates :price
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_day_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
end
