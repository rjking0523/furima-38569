class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :delivery_area_id, :city, :address ,:apartment ,:phone_number ,:user_id ,:item_id ,:token

  with_options presence: { message: "can't be blank" } do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフン含めた半角数字7桁を使用してください', allow_blank: true }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'は半角数字10桁または11桁を使用してください', allow_blank: true }
  end
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, delivery_area_id: delivery_area_id, city: city, address: address, apartment: apartment, phone_number: phone_number, order_id: order.id)
  end

end