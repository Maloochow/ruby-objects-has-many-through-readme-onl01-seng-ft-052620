require_relative './customer'
require_relative './waiter'


class Meal

attr_accessor :watier, :customer, :name, :total, :tip
@@all = []

def self.ordered(customer, name, total, tip)
    @customer = customer
    @name = name
    @total = total
    @tip = tip
    @@all << self
end

end