require 'spec_helper'

describe CarsController do
  Given(:car) { mock_model Car }

  describe 'GET #index' do
    Given(:car1) { mock_model(Car) }
    Given(:car2) { mock_model(Car) }
    Given { Car.should_receive(:all).and_return([car1, car2]) }

    When  { get :index }

    Then  { respond_with :success }
    And   { assigns(:cars).should =~ [car1, car2] }
    And   { assigns(:cars).should_not include car }
  end

  describe 'GET #show' do
    Given { Car.should_receive(:find).and_return(car) }
    When  { get :show, id: car.id }
    Then  { respond_with :success }
    And   { should render_template :show }
  end

  describe 'GET #new' do
    When  { get :new }
    Then  { respond_with :success }
    And   { should render_template :new }
    And   { assigns(:car).should be_a_new Car }
  end

  describe 'POST #create' do
    Given(:car_attrs) { attributes_for :car }
    When  { post :create, car: car_attrs }

    context 'when everything is ok' do
      Given { Car.any_instance.should_receive(:save).and_return(true)}
      Then  { should redirect_to cars_path }
    end

    context 'when something went wrong' do
      Given { Car.should_receive(:new).and_return(car)}
      Given { car.should_receive(:save).and_return(false)}
      Given { car.stub(:errors).and_return({error: 'oops'})}
      Then  { should render_template :new }
    end
  end

  describe 'POST #create with real data' do
    Given(:car_attrs) { attributes_for :car, brand: nil }
    When  { post :create, car: car_attrs }
    Then  { should render_template :new }
  end


  describe 'GET #edit' do
    Given { Car.should_receive(:find).and_return(car) }
    When  { get :edit, id: car.id }
    Then  { respond_with :success }
    And   { should render_template :edit }
  end

  describe 'PUT #update' do
    Given(:car_attrs) { attributes_for :car }
    When  { put :update, id: car.id, car: car_attrs }
    Given { Car.should_receive(:find).and_return(car)}

    context 'when everything is ok' do
      Given { car.should_receive(:update_attributes).and_return(true)}
      Then  { should redirect_to cars_path }
    end

    context 'when something went wrong' do
      Given { car.should_receive(:update_attributes).and_return(false)}
      Given { car.stub(:errors).and_return({error: 'oops'})}
      Then  { should render_template :edit}
    end
  end

  describe 'DELETE #destroy' do
    Given { Car.should_receive(:find).and_return(car)}
    Given { car.should_receive(:destroy) }
    When  { delete :destroy, id: car.id }
    Then  { should redirect_to cars_path  }
  end

end
