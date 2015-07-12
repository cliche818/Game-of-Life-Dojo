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
  end
end
