class FordBuilder

  def product;end
  def produce_wheels;end
  def produce_wind_shields;end
  def produce_abc_breaks;end


end

class Figo
  attr_accessor :parts
  def initialize()
    self.parts = []
  end

  def add part
    self.parts << part
  end

  def list_parts
    self.parts(&:to_s).join(', ')
  end

end

class Fiesta
  attr_accessor :components
  def initialize
    self.components = []
  end

  def attach component
    self.components << component
  end

  def list_components
    self.components
  end
end

class EcoSport
  attr_accessor :segments
  def initialize
    self.segments = []
  end

  def bind segment
    self.segments << segment
  end

  def fetch_segments 
    self.segments
  end
end

class FigoBuilder < FordBuilder
  attr_accessor :product
  def initialize
    reset
  end

  def reset
    self.product = Figo.new
  end

  def produce_wheels
    self.product.parts << "Figo_Wheels"
  end

  def produce_wind_shields
    self.product.parts << "Figo_Wind_Shields"
  end

  def produce_abc_breaks
    self.product.parts << "Figo_ABC_Breaks"
  end
end

class FiestaBuilder < FordBuilder
  attr_accessor :product
  def initialize
    reset
  end

  def reset
    self.product = Fiesta.new
  end

  def produce_wheels
    self.product.components << "Fiesta_Wheels"
  end

  def produce_wind_shields
    self.product.components << "Fiesta_Wind_Shields"
  end

  def produce_abc_breaks
    self.product.components << "Fiesta_ABC_Breaks"
  end
end

class EcoSportBuilder < FordBuilder
  attr_accessor :product
  def initialize
    reset
  end

  def reset
    self.product = EcoSport.new
  end

  def produce_wheels
    self.product.segments << "EcosSport_Wheels"
  end

  def produce_wind_shields
    self.product.segments << "Ecosport_Wind_Shields"
  end

  def produce_abc_breaks
    self.product.segments << "Ecosport_ABC_Breaks"
  end
end


class Director
  attr_accessor :builder
  def initialize
    self.builder = nil
  end

  def build_budget_figo
    self.builder.produce_wheels
  end

  def build_luxury_figo
    self.builder.produce_wheels
    self.builder.produce_abc_breaks
  end

  def build_budget_fiesta
    self.builder.produce_wheels
  end
  
  def build_luxury_fiesta
    self.builder.produce_wheels
    self.builder.produce_abc_breaks
    self.builder.produce_wind_shields
  end

  def build_budget_ecosport
    self.builder.produce_wheels
    self.builder.produce_wind_shields
  end
  
  def build_luxury_ecosport
    self.builder.produce_wheels
    self.builder.produce_abc_breaks
    self.builder.produce_wind_shields
  end

end



begin
  director = Director.new
  builder  = FigoBuilder.new
  director.builder = builder

  puts("***BudgetFigoParts***")
  director.build_budget_figo
  p director.builder.product.list_parts

  puts("***LuxuryFigoParts***")
  director.build_luxury_figo
  p director.builder.product.list_parts

  puts("***BudgetFiestaComponents***")
  director.builder = FiestaBuilder.new
  director.build_budget_fiesta
  p director.builder.product.list_components

  puts("***LuxuryFiestaComponents***")
  director.builder.reset
  director.build_luxury_fiesta 
  p director.builder.product.list_components

end 
