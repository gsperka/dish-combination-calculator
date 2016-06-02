require 'rspec'
require 'place_orders/order_controller'

module Orders
  describe OrderController do
    let(:input)      { nil }
    let(:output)     { nil }
    let(:controller) { OrderController.new(input, output) }

    describe '#parse' do
      context 'with target price and dishes' do
        let(:input) {"$15.05\nmixed fruit,$2.15\nfrench fries,$2.75\nside salad,$3.35\nhot wings,$3.55\nmozzarella sticks,$4.20\nsampler plate,$5.80'\n"}
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
    end


  end
end