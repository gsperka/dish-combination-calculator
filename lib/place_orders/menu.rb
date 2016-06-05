module Orders
  class Menu

    def initialize(dishes)
      @dishes = dishes
    end

    def generate_combinations(target_price)
      sort_by_price_ascending
      container        = []
      min_price        = @dishes.min { |dish| dish.last }.last
      combination_size = (target_price / min_price).floor

      @dishes.permutation.to_a.map { |dish|
        dish.repeated_combination(combination_size) do |item|
          selected = select_until(item, target_price)
          container << selected if selected
        end
      }

      container.uniq.map(&:sort).uniq
    end

    private

      def sort_by_price_ascending
        @dishes.sort_by! {|x| x[1]}
      end

      def select_until(dishes, target_price)
        total = 0
        names = []

        dishes.each do |dish|
          name  = dish.first
          price = dish.last
          if total + price <= target_price
            total += price
            names << name
          end
        end

        names if total == target_price
      end

  end
end
