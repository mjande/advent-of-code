# frozen_string_literal: true

require_relative '../solutions/day2'

describe 'day2' do
  describe '#initial_round_score' do
    it 'returns 8 for round of A Y' do
      expect(initial_round_score('A Y')).to eql(8)
    end

    it 'returns 1 for a round of B X' do
      expect(initial_round_score('B X')).to eql(1)
    end

    it 'returns 6 for a round of C Z' do
      expect(initial_round_score('C Z')).to eql(6)
    end
  end

  describe '#revised_round_score' do
    it 'returns 4 for a round of A Y' do
      expect(revised_round_score('A Y')).to eql(4)
    end

    it 'returns 1 for a round of B X' do
      expect(revised_round_score('B X')).to eql(1)
    end

    it 'returns 7 for a round of C Z' do
      expect(revised_round_score('C Z')).to eq(7)
    end
  end
end
