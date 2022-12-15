# frozen_string_literal: true

input = File.read('./input/day4.input.txt').split("\n")

# Part One

def string_to_ranges(string)
  pairs_array = string.split(',')
  ranges = pairs_array.map do |range_string|
    range_bounds = range_string.split('-')
    range_bounds[0].to_i..range_bounds[1].to_i
  end
end

def is_fully_contained?(range1, range2)
  range1.all? { |section| range2.include?(section) } ||
  range2.all? { |section| range1.include?(section) }
end

count = input.count do |string|
  ranges = string_to_ranges(string)
  is_fully_contained?(ranges[0], ranges[1])
end

puts "Part One Answer: #{count}"

# Part Two

def is_overlapping?(range1, range2)
  range1.any? { |section| range2.include?(section) }
end

count = input.count do |string|
  ranges = string_to_ranges(string)
  is_overlapping?(ranges[0], ranges[1])
end

puts "Part Two Answer: #{count}"
