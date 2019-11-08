#from __future__ import annotations 
from abc import ABC, abstractmethod

class Creator(ABC):

    @abstractmethod
    def factory_method(self):
        pass

    def some_operations(self) -> str:
        product = self.factory_method()
        result = f"Creator: The same creator's code has just worked with {product.operation()}"

        return result


class ConcreteCreator1(Creator):
    
    def factory_method(self):
        return ConcreteProduct1()


class ConcreteCreator2(Creator):
    
    def factory_method(self):
        return ConcreteProduct2()


class Product(ABC):

    @abstractmethod
    def operation(self) ->str:
        pass


class ConcreteProduct1(Product):
    
    def operation(self) ->str:
        return "{Result of creating ConcreteProduct1}"

class ConcreteProduct2(Product):
  
    def operation(self) ->str:
        return "{Result of creating ConcreteProduct2}"


def client_code(creator: Creator) -> None:
    print(f"Client: I'm not aware of the creator's class, but it still works.")
    print(f"creator: {creator.some_operations()}" )


if __name__ == "__main__":
    print("App: Launched with the ConcreteProduct1")
    client_code(ConcreteCreator1())
    print("\n")

    print("App: Launched with the ConcreteProduct2")
    client_code(ConcreteCreator2())



  


