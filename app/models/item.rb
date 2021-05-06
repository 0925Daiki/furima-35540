class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :name,        presence: true
  validates :description, presence: true
  validates :image,       presence: true
  validates :price,       presence: true, format:{with:/\A^[0-9]*$\z/}, numericality:{greater_than: 300, less_than: 9999999}
  validates :category_id,        presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :status_id,          presence: true, numericality: { other_than: 1 }
  validates :shipping_area_id,   presence: true, numericality: { other_than: 1 }
  validates :days_to_ship_id,    presence: true, numericality: { other_than: 1 }

end
