class CarsController < ApplicationController
  inherit_resources

  respond_to :html

  #actions :all

  def create
    create!
  end

  def update
    update! { collection_path }
  end

private

  def resource_params
    params.require(:car).permit(:brand, :name, :car_type, :engine_volume, :production_year)
  end
end
