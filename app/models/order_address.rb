class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :city, :building_name, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :city
    validates :phone, format:{with:/\A^[0-9]*$\z/}, length:{minimum: 1, maximum: 11 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, city: city, building_name: building_name, phone: phone, order_id: order.id)
  end


end
