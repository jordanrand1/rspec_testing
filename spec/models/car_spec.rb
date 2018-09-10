require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes' do 

    [
      :make,
      :model,
      :price,
      :interior,
      :color,
      :age,
      :mileage,
      :vin
    ].each do |attr|
      it { should respond_to attr}
    end

    it { should validate_uniqueness_of :vin }
    it { should validate_presence_of :vin }

  end 

  describe "class methods" do
    before(:each) do
      @car1 = Car.create(make: 'Zebra', model: "Monkey", price: 20000, vin: 123)
      @car2 = Car.create(make: 'Abe', model: "Zinc", price: 200, vin: 1234)
      @car3 = Car.create(make: 'Bugs', model: "Bunny", price: 30000, vin: 12345)
    end

    it 'sorts by make' do
      cars = Car.by_make
      expect(cars).to eq([@car2, @car3, @car3])
    end

    it 'sorts by model' do
      cars = Car.by_model
      expect(cars).to eq([@car3, @car1, @car2])
    end

    it 'sorts by price asc' do
      cars = Car.by_price
      expect(cars).to eq([@car2, @car1, @car3])
    end

    it 'sorts by price desc' do
      cars = Car.by_price(:desc)
      expect(cars).to eq([@car3, @car1, @car2])
    end

  end

  describe "instance methods" do
    before(:each) do
      @attr = {
        make: 'Toyota',
        model: 'Prius',
        color: 'Red',
        age: 2000,
        mileage: 100,
        price: 10000.50,
        interior: 'Blue',
        vin: '1234'
      }

      @car = Car.create(@attr)
    end

    it 'paints the car' do
      @car.paint('Pink')
      expect(@car.color).to eq('Pink')
    end

    it 'returns hash of attributes' do
      expect(@car.info).to eq(@attr.with_indifferent_access)
    end

    it 'honks the horn' do
      expect(@car.honk).to eq('Beep Beep!')
    end

  end

end
