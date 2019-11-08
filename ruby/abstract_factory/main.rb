class FordCar
  def wheels()
  end

  def mirrors()
  end
end


class FigoVersionOne < FordCar
  def wheels()
    return V1Wheels.new
  end

  def mirrors()
    return V1Mirrors.new
  end
end

class FigoVersionTwo < FordCar
  def wheels()
    return V2Wheels.new
  end

  def mirrors()
    return V2Mirrrors.new
  end
end

class Accessories
  def get_acc
  end
end

class V1Wheels < Accessories
  def get_acc
    puts("Version_1 wheels")
  end
end

class V1Mirrors < Accessories
  def get_acc
    puts("Version_1 morrors")
  end
end

class V2Mirrrors < Accessories
  def get_acc
    puts("Version_2 mirrors")
  end
end

class V2Wheels < Accessories
  def get_acc
    puts("Version_2 wheels")
  end
end


def client_code(factory)
  wheel = factory.wheels
  mirror = factory.mirrors


  wheel.get_acc
  mirror.get_acc
end


begin
  client_code(FigoVersionOne.new)
  client_code FigoVersionTwo.new
end
