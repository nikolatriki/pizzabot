RSpec.describe Pizzabot do
  subject(:pizzabot) { PizzaBot.new(['5x5 (1, 3) (4, 4)']) }

  describe 'initialize' do
    context 'with regex' do
      it 'receives the grid values' do
        expect(pizzabot.send(:grid)).to eq([5, 5])
      end

      it 'receives location values' do
        expect(pizzabot.send(:locations)).to eq([1, 3, 4, 4])
      end
    end
  end

  describe 'validate locations' do
    it 'has x and y locations on the grid' do
      expect(pizzabot.send(:valid_location?)).to be true
    end

    context 'has location off the grid' do
      let(:pizzabot_off) { PizzaBot.new(['5x5 (1, 3) (6, 4)']) }

      it 'does not pass validation' do
        expect(pizzabot_off.send(:valid_location?)).to be false
      end

      it 'can not make delivery' do
        expect(pizzabot_off.instructions).to eq('Location is out of grid!')
      end
    end
  end

  describe 'gets directions' do
    context 'moving east-west' do
      it 'moves east' do
        expect(pizzabot.send(:x_direction, 1, 0)).to eq 'E'
      end

      it 'moves west' do
        expect(pizzabot.send(:x_direction, 0, 1)).to eq 'W'
      end
    end

    context 'moving north-south' do
      it 'moves north' do
        expect(pizzabot.send(:y_direction, 1, 0)).to eq 'N'
      end

      it 'moves south' do
        expect(pizzabot.send(:y_direction, 0, 1)).to eq 'S'
      end
    end

    context 'makes a drop' do
      it 'drops at 0' do
        expect(PizzaBot.new(['5x5 (0, 0)']).send(:xy_directions, '', 0, 0)).to eq 'D'
      end
    end
  end

  describe 'prints out the instructions' do
    it 'gives instructions to Pizzabot' do
      expect(pizzabot.instructions).to eq 'ENNNDEEEND'
    end
  end
end
