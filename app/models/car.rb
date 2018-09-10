class Car < ApplicationRecord
  validates :vin, uniqueness: true, presence: true

  def self.by_model
    order(:model)
  end

  def self.by_make
    order(:make)
  end

  def self.by_price(direction = :asc)
    order(price: direction)
  end

  def paint(color)
    self.update(color: color)
  end

  def info
    self.attributes.except('id', 'created_at', 'updated_at')
  end

  def honk
    'Beep Beep!'
  end
end
