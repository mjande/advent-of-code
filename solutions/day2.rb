input = File.read('./input/day2.input.txt').split("\n")

def shape_score(my_choice)
  if my_choice == 'X' # Rock
    1
  elsif my_choice == 'Y' # Paper
    2
  elsif my_choice == 'Z' # Scissors
    3
  end
end

def outcome_score(my_choice, opp_choice)
  if my_choice == 'X' # Rock
    if opp_choice == 'A' # vs Rock
      3 # Draw
    elsif opp_choice == 'B' # vs Paper
      0 # Loss
    elsif opp_choice == 'C' # vs Scissors
      6 # Win
    end
  elsif my_choice == 'Y' # Paper
    if opp_choice == 'A' # vs Rock
      6 # Win
    elsif opp_choice == 'B' # vs Paper
      3 # Draw
    elsif opp_choice == 'C' # vs Scissors
      0 # Loss
    end
  elsif my_choice == 'Z' # Scissors
    if opp_choice == 'A' # vs Rock
      0 # Loss
    elsif opp_choice == 'B' # vs Paper
      6 # Win
    elsif opp_choice == 'C' # vs Scissors
      3 # Draw
    end
  end
end

def initial_round_score(round_string)
  opp_choice = round_string[0]
  my_choice = round_string[2]

  shape_score(my_choice) + outcome_score(my_choice, opp_choice)
end

def choose_my_shape(opp_choice, result)
  if result == 'X' # Loss
    if opp_choice == 'A' # Rock
      'Z' # vs Scissors
    elsif opp_choice == 'B' # Paper
      'X' # vs Rock
    elsif opp_choice == 'C' # Scissors
      'Y' # vs Paper
    end
  elsif result == 'Y' # Draw
    if opp_choice == 'A' # Rock
      'X' # vs Rock
    elsif opp_choice == 'B' # Paper
      'Y' # vs Paper
    elsif opp_choice == 'C' # Scissors
      'Z' # vs Scissors
    end
  elsif result == 'Z' # Win
    if opp_choice == 'A' # Rock
      'Y' # vs Paper
    elsif opp_choice == 'B' # Paper
      'Z' # vs Scissors
    elsif opp_choice == 'C' # Scissors
      'X' # vs Rock
    end
  end
end

def revised_round_score(round_string)
  result = round_string[2]
  
  opp_choice = round_string[0]
  my_choice = choose_my_shape(opp_choice, result)

  shape_score(my_choice) + outcome_score(my_choice, opp_choice)
end

puts input.sum { |string| revised_round_score(string) }