require_relative 'menu'

module Orders
  class OrderController
    attr_reader :menu

    def initialize(input, output)
      @input  = input
      @output = output
    end

    def call
      options = process
      render(options)
    end

    def process
      parsed       = parse
      target_price = parsed.shift.pop
      dishes       = parsed
      raise ArgumentError.new('The input is not in the correct format') if dishes.empty?
      @menu        = Menu.new(dishes)
      @menu.generate_combinations(target_price)
    end

    def parse
      @input.each_line.map { |x| x.chomp.split(',')}
    end

    def render(options)
      if options.count == 0
        @output.puts "No combination of dishes!"
      else
        options.each_with_index do |o, index|
          @output.puts "Combination #{(index + 1)} is: #{o.map(&:name).join(', ')}"
        end
      end
    end

  end
end
