class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :price, presence: true, format:{with:/\A^[0-9]*$\z/}, numericality:{greater_than: 300, less_than: 9999999}

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_charge_id
    validates :status_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
end
