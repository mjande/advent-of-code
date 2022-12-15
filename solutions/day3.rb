# frozen_string_literal: true

input = File.read('./input/day3.input.txt').split("\n")

# Part One

# 1. Split string into separate, equal compartments
# 2. Find item type that is repeated in both compartments
# 3. Find and return priority for that item type

def find_misplaced_item_type(compartment1, compartment2)
  compartment1.each_char do |letter| # O(n)
    return letter if compartment2.include?(letter)
  end
end

def convert_to_priority_number(letter)
  ascii_item_type = letter.ord

  if ascii_item_type >= 97
    ascii_item_type - 96
  elsif ascii_item_type <= 90
    ascii_item_type - 38
  end
end

def calculate_priority_of_misplaced_item_type(rucksack_string)
  # Split into compartments
  mid = rucksack_string.length / 2
  compartment1 = rucksack_string[0, mid]
  compartment2 = rucksack_string[mid, 50]

  misplaced_item_type = find_misplaced_item_type(compartment1, compartment2)

  # Convert to priority number
  convert_to_priority_number(misplaced_item_type)
end

sum = input.sum do |rucksack|
  calculate_priority_of_misplaced_item_type(rucksack)
end

puts "Part One Answer: #{sum}"

# Part Two

# 1. Separate lines into three elf group
# 2. Find badge item type shared by all three
# 3. Convert to priority

def find_shared_item_type(rucksack1, rucksack2, rucksack3)
  rucksack1.each_char do |letter|
    return letter if rucksack2.include?(letter) && rucksack3.include?(letter)
  end
end

sum = 0
i = 2
until i >= input.length 
  badge_item_type = find_shared_item_type(input[i - 2], input[i - 1], input[i])

  sum += convert_to_priority_number(badge_item_type)
  i += 3
end

puts "Part Two Answer: #{sum}"
