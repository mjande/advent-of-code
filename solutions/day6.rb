# frozen_string_literal:true

input = File.read('./input/day6.input.txt')

# Part One

def find_stream_start_index(string, length)
  i = length - 2

  while i < string.length
    i += 1

    n = -1
    prev = [string[i]]

    while n < length
      break if prev.include?(string[i + n])

      prev << string[i + n]
      n -= 1
    end

    next unless prev.length >= length

    return i + 1
  end
end

index = find_stream_start_index(input, 4)
puts "Part One Answer: #{index}"

# Part Two

index = find_stream_start_index(input, 14)
puts "Part Two Answer: #{index}"
