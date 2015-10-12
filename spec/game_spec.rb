require 'spec_helper'

describe Game do

  describe '#play' do
    it 'should call Life#next_phase 5 times' do
      life = Life.new(5,5)
      expect(life).to receive(:next_phase).exactly(5)
      expect(life).to receive(:display).exactly(5)

      Game.new(life).play(5)
    end
  end
end