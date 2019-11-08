from abc import ABC, abstractmethod 


class AbstractFactory(ABC):

    @abstractmethod
    def create_product_a(self):
        pass
    
    @abstractmethod
    def create_product_b(self):
        pass


class ConcreteFactory1(AbstractFactory):
    
    def create_product_a(self):
        return ConcreteProductA1()

    def create_product_b(self):
        return ConcreteProuctB1()


class ConcreteFactory2(AbstractFactory):
  
    def create_product_a(self):
        return ConcreteProductA2()
  
    def create_product_b(self):
        return ConcreteProuctB2()


class AbstractProuctA(ABC):
  
    def useful_function_a(self) ->str:
        pass

class ConcreteProductA1(AbstractProuctA):
    def useful_function_a(self):
        pass

class ConcreteProductA2(AbstractProuctA):
    def useful_function_a(self):
        pass



class AbstractProuctB(ABC):
    def useful_function_b(self):
        pass

class ConcreteProuctB1(AbstractProuctB):
    def useful_function_b(self):
        pass

    def another_useful_function(self, collaborator: AbstractProuctA):
        collaborator.useful_function_a()
      

class ConcreteProuctB2(AbstractProuctB):
    def useful_function_b(self):
        pass

    def another_useful_function(self, collaborator: AbstractProuctA):
        collaborator.useful_function_a()


def client_code(factory: AbstractFactory) -> None:
    product_a = factory.create_product_a()
    product_b = factory.create_product_b()


    print("hello-->", product_b.useful_function_b())
    print("bye---->", product_b.another_useful_function(product_a))


if __name__ == "__main__":

    client_code(ConcreteFactory1())
    client_code(ConcreteFactory2())

