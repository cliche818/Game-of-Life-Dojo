require 'spec_helper.rb'

describe Life do

  before do
    @life = Life.new(2,3)
  end

  it 'should print an empty board' do
    expect(@life.display).to eq(". . .\n. . .\n")
  end

  describe 'add_cell' do

    it 'should add a cell to coordinates x = 1, y = 1' do
      @life.set_initial_living_cell(1,1)
      expect(@life.display).to eq(". . .\n. * .\n")
    end

    it 'should add a cell to every space on the board' do
      2.times do |x|
        3.times do |y|
          @life.set_initial_living_cell(x, y)
        end
      end

      expect(@life.display).to eq("* * *\n* * *\n")
    end
  end

  describe 'next_phase' do
    it 'should get to the next generation where cell [1,1] dies because fewer than 2 neighbours' do
      @life.set_initial_living_cell(1,1)
      @life.next_phase
      expect(@life.display).to eq(". . .\n. . .\n")
    end

    it 'should get to the next generation where cell [1,1] stays alive because it has 2 neighbours' do
      life = Life.new(3,3)
      life.set_initial_living_cell(1,1)
      life.set_initial_living_cell(0,0)
      life.set_initial_living_cell(2,2)

      life.next_phase
      expect(life.display).to eq(". . .\n. * .\n. . .\n")
    end

    it 'should get to the next generation where cell [1,1] lives because it has 3 neighbours' do
      life = Life.new(3,3)
      life.set_initial_living_cell(1,1)
      life.set_initial_living_cell(0,0)
      life.set_initial_living_cell(1,2)
      life.set_initial_living_cell(2,0)

      p life.display

      life.next_phase
      expect(life.display).to eq(". * .\n* * .\n. * .\n")
    end

    xit 'should get to the next generation where cell [1,1] dies because it has more than 3 neighbours' do
      life = Life.new(3,3)
      life.set_initial_living_cell(1,1)
      life.set_initial_living_cell(0,1)
      life.set_initial_living_cell(1,0)
      life.set_initial_living_cell(1,2)
      life.set_initial_living_cell(2,1)

      life.next_phase
      expect(life.display).to eq(". * .\n* . *\n. * .\n")
    end

    xit 'should get to the next generation where space[1,1] lives because it has 3 neighbours' do
      life = Life.new(3,3)
      life.set_initial_living_cell(0,0)
      life.set_initial_living_cell(1,2)
      life.set_initial_living_cell(2,0)
      life.next_phase

      expect(life.display).to eq(". . .\n. * .\n. . .\n")
    end
  end

end
