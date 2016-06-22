require_relative 'dish'
require 'monetize'

module Orders
  class Menu

    def initialize(dishes)
      @dishes = dishes.map {|name,price| Dish.new(name, Monetize.parse(price))}
    end

    def generate_combinations(target_price)
      target_price = Monetize.parse(target_price)
      @dishes.sort_by!(&:price)
      container        = []
      min_price        = @dishes.first.price
      combination_size = (target_price / min_price).floor

      @dishes.repeated_combination(combination_size) do |item|
        selected = select_until(item, target_price)
        container << selected if selected
      end

      container.uniq.map(&:sort).uniq
    end

    private

      def select_until(dishes, target_price)
        total = Money.new(0)
        combination = dishes.each_with_object([]) do |dish, combo|
          if total + dish.price <= target_price
            total += dish.price
            combo << dish
          end
        end

        combination if total == target_price
      end

  end
end
