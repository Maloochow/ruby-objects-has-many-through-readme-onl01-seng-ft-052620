class Waiter

attr_accessor :name, :yrs_experience

@@all = []

def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
end

def self.all
    @@all
end

def new_meal(customer, total, tips)
    Meal.new(self, customer, total, tips)
end

def meals
    Meal.all.select {|meal| meal.waiter == self}
end

def customers
    meals.map {|meal| meal.customer}
end

def best_tipper
    best_tipped_meal = meals.max {|m1, m2| m1.tip <=> m2.tip}
    best_tipped_meal.customer
end

end