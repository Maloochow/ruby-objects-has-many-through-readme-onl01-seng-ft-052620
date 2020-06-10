require 'pry'
require_relative './meal'
require_relative './customer'

class Waiter

attr_reader :name, :yr_experience
@@all = []

def initialize(name, year)
    @name = name
    @yr_experience = year
    @@all << self
end

def serve_meal(meal_name)
    dish = Meal.all.select {|m| m.name == meal_name}
    dish.waiter = self
end

def self.all
    @@all
end

def meals
    Meal.all.select {|m| m.waiter == self}
end

def best_tipper
    best_tipped_meal = meals.max {|m1, m2| m1.tip <=> m2.tip}
    best_tipped_meal.customer
end

end


binding.pry