require 'rspec'
require 'place_orders/menu'

module Orders
  describe Menu do
    let(:menu) { Menu.new(dishes) }

    describe '#generate_combinations' do

      context 'with dishes that add up to the target price' do
        let(:target_price) { 4.90 }
        let(:dishes)       {[
            ['mixed fruit',  2.15],
            ['french fries', 2.75]
        ]}
        it 'shows all dishes' do
          expect(menu.generate_combinations(target_price)).to eql [['mixed fruit', 'french fries']].map(&:sort)
        end
      end
    end
  end
end