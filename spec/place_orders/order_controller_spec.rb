require 'rspec'
require 'spec_helper'
require 'place_orders/order_controller'

module Orders
  describe OrderController do
    let(:input) {"$15.05\nmixed fruit,$2.15\nfrench fries,$2.75\nside salad,$3.35\nhot wings,$3.55\nmozzarella sticks,$4.20\nsampler plate,$5.80'\n"}
    let(:output)     { nil }
    let(:controller) { OrderController.new(input, output) }
    let(:dishes)     { [["mixed fruit", 2.15], ["french fries", 2.75], ["side salad", 3.35], ["hot wings", 3.55], ["mozzarella sticks", 4.2], ["sampler plate", 5.8]] }
    let(:menu)       { Menu.new(dishes) }

    describe '#parse' do
      context 'with target price and dishes' do
        it 'splits and converts the input' do
          expect(controller.parse).to eql [
            [                    15.05],
            ['mixed fruit',       2.15],
            ['french fries',      2.75],
            ['side salad',        3.35],
            ['hot wings',         3.55],
            ['mozzarella sticks', 4.20],
            ['sampler plate',     5.80]
          ]
        end
      end

      context 'with invalid input' do
      	let(:input) {""}
      	it 'raises an error if the input is not valid' do 
      		expect{controller.parse}.to raise_error(ArgumentError, 'The input is not in the correct format')
      	end
      end
    end

    describe '#render' do
      context 'with options of dishes' do
        let(:options) {[['mixed fruit', 'french fries']]}
        it 'displays dishes' do
        	response = capture_stdout {controller.render(options)}
        	expect(response).to eql "\"Combination 1 is: mixed fruit, french fries\"\n"
        end
      end
    end

    describe '#process' do
      context 'with parsed input' do
        let(:target_price) { 4.90 }
        it 'sends message #get_combinations with target price' do
        	allow(menu).to receive(:generate_combinations).with(target_price)
          controller.process
        end
      end
    end


  end
end