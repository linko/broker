class Car < ActiveRecord::Base
  extend Enumerize

  enumerize :car_type, in: [:sedan, :hatchback, :universal, :crossover], predicates: true

  validates :brand, :name, :car_type, :engine_volume, :production_year, presence: true

  validates :production_year, numericality: { only_integer: true, greater_than: 1950 }
  validates :engine_volume,   numericality: { only_integer: true, greater_than: 0    }

  validates :car_type, inclusion: car_type.values

  validates :brand, :name, length: { maximum: 255 }
end
