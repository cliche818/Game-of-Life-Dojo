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
      @life.add_cell(1,1)
      expect(@life.display).to eq(". . .\n. * .\n")
    end

    it 'should add a cell to every space on the board' do
      2.times do |x|
        3.times do |y|
          @life.add_cell(x, y)
        end
      end

      expect(@life.display).to eq("* * *\n* * *\n")
    end
  end

  describe 'next_phase' do
    it 'should get to the next generation where cell [1,1] dies because fewer than 2 neighbours' do
      @life.add_cell(1,1)
      @life.next_phase
      expect(@life.display).to eq(". . .\n. . .\n")
    end
  end

end
