require 'spec_helper.rb'

describe Life do

  it 'should print an empty board' do
    life = Life.new(2,3)
    expect(life.display).to eq(". . .\n. . .\n")
  end
end
