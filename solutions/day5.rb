# frozen_string_literal: true

input = File.read('./input/day5.input.txt').split("\n")

# Input
# Convert input lines into pile arrays

def convert_to_piles_array(input)
  piles = []

  0.upto(8) do |pile_num|
    pile = []
    crate_index = pile_num * 4

    i = 7
    until i.negative?
      crate = input[i][crate_index, 3]
      break if crate.delete(' ').empty?

      pile.push(crate)
      i -= 1
    end

    piles.push(pile)
  end

  piles
end

# Put rest of input into procedures array
procedures = input.slice(10, input.length)

# Part One

piles = convert_to_piles_array(input)

def parse_procedure(string)
  # Return hash with { num_of_crates, original_pile, new_pile }
  words = %w[move from to]
  numbers = []

  string.split(' ').each do |term|
    next if words.include?(term)

    numbers.push(term.to_i)
  end

  { num_of_crates: numbers[0], original_pile: numbers[1] - 1, new_pile: numbers[2] - 1 }
end

def execute_procedure_for5000(hash, piles)
  hash[:num_of_crates].times do
    crate = piles[hash[:original_pile]].pop
    piles[hash[:new_pile]].push(crate)
  end
end

procedures.each do |procedure_string|
  procedure = parse_procedure(procedure_string)
  execute_procedure_for_5000(procedure, piles)
end

top_crates = ''

piles.each do |pile|
  top_crates += pile[-1][1]
end

puts "Part One Answer: #{top_crates}"

# Part Two

piles = convert_to_piles_array(input)

def execute_procedure_for5001(hash, piles)
  crates = piles[hash[:original_pile]].pop(hash[:num_of_crates])
  piles[hash[:new_pile]].push(*crates)
end

procedures.each do |procedure_string|
  procedure = parse_procedure(procedure_string)
  execute_procedure_for_5001(procedure, piles)
end

top_crates = ''

piles.each do |pile|
  top_crates += pile[-1][1]
end

puts "Part Two Answer: #{top_crates}"
