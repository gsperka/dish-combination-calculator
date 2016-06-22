module Orders
  class Dish < Struct.new(:name, :price)
    def <=>(other)
      name <=> other.name
    end
  end
end