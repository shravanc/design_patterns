class Creator
  def factory_method
  end

  def create_wheels
    product = factory_method
    product.wheels
  end

end


class CreateCar < Creator
  def factory_method
    Car.new
  end

end

class CreateBike < Creator
  def factory_method
    Bike.new
  end
end


class Vehicles
  def wheels
    raise "Not defined"
  end
end


class Car < Vehicles
  def wheels
    return 4
  end
end


class Bike < Vehicles
  def wheels
    return 2
  end
end

def client_code( obj )
  obj.create_wheels
end


begin
  p client_code(CreateCar.new)
  p client_code(CreateBike.new)
end
