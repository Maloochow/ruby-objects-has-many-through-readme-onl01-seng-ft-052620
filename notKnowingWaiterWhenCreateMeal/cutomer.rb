require_relative './meal'
require_relative './waiter'

class Customer

attr_reader :name, :age
@@all = []

def initialize(name, age)
    @name = name
    @age = age
    @@all << self
end

def order_meal(dish_name, total, tip)
    Meal.ordered(self, dish_name, total, tip)
end

def self.all
    @@all
end

def meals
    Meal.all.select{|m| m.customer == self}
end


end