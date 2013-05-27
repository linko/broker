require 'spec_helper'

describe Car do
  %i(brand name car_type engine_volume production_year).each do |field|
    it { should validate_presence_of field }
  end

  it { should validate_numericality_of(:production_year).only_integer }
  it { should validate_numericality_of(:engine_volume).only_integer   }

  it { should ensure_inclusion_of(:car_type).in_array(described_class.car_type.values) }

  it { should ensure_length_of(:brand).is_at_most(255) }
  it { should ensure_length_of(:name).is_at_most(255) }
end
