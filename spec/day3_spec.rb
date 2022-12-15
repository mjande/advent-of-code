# frozen_string_literal: true

require_relative '../solutions/day3'

describe('#find_misplaced_item_type') do
  it('returns p for a given rucksack') do
    compartment1 = 'vJrwpWtwJgWr'
    compartment2 = 'hcsFMMfFFhFp'

    expect(find_misplaced_item_type(compartment1, compartment2)).to eql('p')
  end

  it 'returns L for a given rucksack' do
    compartment1 = 'jqHRNqRjqzjGDLGL'
    compartment2 = 'rsFMfFZSrLrFZsSL'

    expect(find_misplaced_item_type(compartment1, compartment2)).to eql('L')
  end

  it 'returns P for a given rucksack' do
    compartment1 = 'PmmdzqPrV'
    compartment2 = 'vPwwTWBwg'

    expect(find_misplaced_item_type(compartment1, compartment2)).to eql('P')
  end
end

describe('#calculate_priority_of_misplaced_item_type') do
  it 'returns 22 for a certain rucksack' do
    expect(calculate_priority_of_misplaced_item_type('wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn')).to eql(22)
  end

  it 'returns 20 for a given rucksack' do
    expect(calculate_priority_of_misplaced_item_type('ttgJtRGJQctTZtZT')).to eql(20)
  end

  it 'returns 19 for a given rucksack' do
    expect(calculate_priority_of_misplaced_item_type('CrZsJsPPZsGzwwsLwLmpwMDw')).to eql(19)
  end
end

describe('#find_shared_item_type') do
  it 'returns r for badge item type' do
    rucksack1 = 'vJrwpWtwJgWrhcsFMMfFFhFp'
    rucksack2 = 'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL'
    rucksack3 = 'PmmdzqPrVvPwwTWBwg'

    expect(find_shared_item_type(rucksack1, rucksack2, rucksack3)).to eql('r')
  end

  it 'returns Z for badge item type' do
    rucksack1 = 'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn'
    rucksack2 = 'ttgJtRGJQctTZtZT'
    rucksack3 = 'CrZsJsPPZsGzwwsLwLmpwMDw'

    expect(find_shared_item_type(rucksack1, rucksack2, rucksack3)).to eql('Z')
  end
end
