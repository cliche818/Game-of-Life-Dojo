require 'spec_helper.rb'

describe Cell do

  describe 'neighbour_count' do

    it 'should have a neighbour count of 2' do
      cell = Cell.new(1,1)
      board= [ [Cell.new(0,1,false), Cell.new(0,1,true), Cell.new(0,1,false)],
              [Cell.new(0,1,false), cell, Cell.new(0,1,false)],
              [Cell.new(0,1,false), Cell.new(2,1,true), Cell.new(0,1,false)]]
      expect(cell.neighbour_count(board)).to eq(2)
    end


    it 'should have a neighbour count of 1 at the top left corner' do
      cell = Cell.new(0,0)
      board= [ [cell, Cell.new(0,1,false), Cell.new(0,1,false)],
               [Cell.new(0,1,false), Cell.new(1,1,true), Cell.new(0,1,false)],
               [Cell.new(0,1,false), Cell.new(2,1,true), Cell.new(0,1,false)]]
      expect(cell.neighbour_count(board)).to eq(1)
    end

    it 'should have a neighbour count of 1 at the bottom right corner'do
      cell = Cell.new(2,2)
      board= [ [Cell.new(0,0,true), Cell.new(0,1,false), Cell.new(0,1,false)],
               [Cell.new(0,1,false), Cell.new(0,1,false), Cell.new(0,1,false)],
               [Cell.new(0,1,false), Cell.new(2,1,true), cell]]

      expect(cell.neighbour_count(board)).to eq(1)
    end
  end

end