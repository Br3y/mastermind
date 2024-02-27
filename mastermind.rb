# setup var array color to insert 8 primary colors from index 0 to 7
# it will be both used by codemaker and codebreaker
color = ["red", "blue", "yellow", "green", "purple", "orange", "brown", "black"]
# set and insert 4 secret_code for codemaker
secret_code = []
# set guess to 1, max of 12 guess for codebreaker to win the game 
guess = 1

loop do 

  print "Would you like to become CodeMaker or CodeBreaker( M/B )?: "
  player = gets.chomp.to_s

  if player.upcase == "M"
    break
  elsif player.upcase == "B"
    break
  else 
    puts "Invalid Input. Try Again"
  end

end

# CodeMaker
loop do
  if (secret_code.length == 4)
    break
  end

  uniq_color = color[rand(0..7)]

  unless secret_code.include?(uniq_color)
    secret_code << uniq_color
  end

end
p secret_code

# CodeBreaker
loop do 
  # keep reset or removing values every loop
  player_pick = []

  if guess > 12
    puts "Game Over. CodeMaker Wins!"
    break
  end

  # "%02d" % int_value - format number into two digits
  puts "Guess:#{"%02d" % guess}/12 - pick a number from 1 to 8: "

  color.each_with_index do |value, index|
    puts "#{index+1}: #{value}"
  end

  4.times do 
    player_pick << color[gets.chomp.to_i - 1]
  end

  p player_pick

  result = []
  secret_code.each_with_index do |maker, i|
    player_pick.each_with_index do |breaker, j|
      if maker == breaker
        if i == j
          result.push("red")
        else 
          result.push("white")
        end
      end
    end
  end
  puts "how close are you winning? #{result}"

  if secret_code == player_pick
    puts "CodeBreaker Wins!"
    break
  end

  guess += 1
  
end