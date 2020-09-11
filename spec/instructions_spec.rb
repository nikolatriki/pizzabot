RSpec.describe Pizzabot do
  subject { PizzaBot.new(['5x5 (1, 3) (4, 4)']) }

  describe 'initialize' do
    it { is_expected.to have_attributes(input_string: ['5x5', '1', '3', '4', '4']) }
    context 'with regex' do
      it 'receives the grid values' do
        expect(subject.send(:grid)).to contain_exactly(5, 5)
      end

      it 'receives location values' do
        expect(subject.send(:locations)).to contain_exactly(1, 3, 4, 4)
      end
    end
  end

  describe 'validate locations' do
    it 'has x and y locations on the grid' do
      expect(subject.send(:valid_location?)).to be true
    end

    context 'has location off the grid' do
      let(:pizzabot) { PizzaBot.new(['5x5 (1, 3) (6, 4)']) }

      it 'does not pass validation' do
        expect(pizzabot.send(:valid_location?)).to be false
      end

      it 'can not make delivery' do
        expect(pizzabot.instructions).to eq('Location is out of grid!')
      end
    end
  end

  describe 'gets directions' do
    context 'moving east-west' do
      it 'moves east' do
        expect(subject.send(:x_direction, 1, 0)).to eq 'E'
      end

      it 'moves west' do
        expect(subject.send(:x_direction, 0, 1)).to eq 'W'
      end
    end

    context 'moving north-south' do
      it 'moves north' do
        expect(subject.send(:y_direction, 1, 0)).to eq 'N'
      end

      it 'moves south' do
        expect(subject.send(:y_direction, 0, 1)).to eq 'S'
      end
    end

    context 'makes a drop' do
      it 'drops at the location' do
        expect(PizzaBot.new(['5x5 (0, 0)']).send(:xy_directions, '', 0, 0)).to eq 'D'
      end
    end
  end

  describe 'lists the instructions' do
    let(:instructions) { subject.instructions }
    it { expect(instructions).to start_with 'E' }
    it { expect(instructions).to end_with 'D' }

    it 'gives correct instructions to Pizzabot' do
      expect(instructions).to eq 'ENNNDEEEND'
    end
  end
end
