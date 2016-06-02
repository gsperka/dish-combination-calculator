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
          expect(menu.generate_combinations(target_price)).to eql [['french fries', 'mixed fruit']].map(&:sort)
        end
      end

      context 'with no dishes adding up to the target price' do
        let(:target_price) { 3.00 }
        let(:dishes)       {[
            ['mixed fruit',  2.15],
            ['french fries', 2.75]
        ]}
        it 'shows only the first two dishes' do
          expect(menu.generate_combinations(target_price)).to eql []
        end
      end


      context 'with first two dishes adding up to the target price' do
        let(:target_price) { 4.90 }
        let(:dishes)       {[
            ['mixed fruit',  2.15],
            ['french fries', 2.75],
            ['side salad',   3.35]
        ]}
        it 'shows only the first two dishes' do
          expect(menu.generate_combinations(target_price)).to eql [['mixed fruit', 'french fries']].map(&:sort)
        end
      end


      context 'with last two dishes adding up to the target price' do
        let(:target_price) { 6.10 }
        let(:dishes)       {[
            ['mixed fruit',  2.15],
            ['french fries', 2.75],
            ['side salad',   3.35]
        ]}
        it 'excludes the first dish' do
          expect(menu.generate_combinations(target_price)).to eql [['french fries', 'side salad']].map(&:sort)
        end
      end


      context 'with two of the first dish adding up to the target price' do
        let(:target_price) { 4.30 }
        let(:dishes)       {[
            ['mixed fruit',  2.15]
        ]}
        it 'includes the first dish twice' do
          expect(menu.generate_combinations(target_price)).to eql [['mixed fruit', 'mixed fruit']].map(&:sort)
        end
      end

    end
  end
end