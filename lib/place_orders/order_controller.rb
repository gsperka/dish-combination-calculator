module Orders
  class OrderController
    attr_writer :menu_source
    attr_reader :menu

    def initialize(input, output)
      @input  = input
      @output = output
    end


    def parse
      raise ArgumentError.new('The input is not in the correct format') if @input.empty?
      @input.each_line.map { |x|
        x.chomp.split(',').tap { |y|
          y[-1] = y[-1].to_s[1..-1].to_f
        }
      }
    end

    def render(options)
      if options.count == 0
        p "No combination of dishes!"
      else
        counter = 1
        options.each do |o|
          p "Combination " + counter.to_s + " is: " + o.join(', ')
          counter += 1
        end
      end
    end

  end
end
