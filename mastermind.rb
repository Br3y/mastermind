class MasterMindGame
  attr_accessor :color, :guess, :player, :player_color, :bot_color, :result

  def initialize(player)
    # make player choice if he want to become code maker or breaker
    @player = player
    # setup var array color to insert 8 primary colors from index 0 to 7
    # it will be both used by codemaker and codebreaker
    @color = ["red", "blue", "yellow", "green", "purple", "orange", "brown", "black"]
    # set guess to 1, max of 12 guess for codebreaker to win the game 
    @guess = 1
    # set player and bot pick
    # flexible even if player is code maker or breaker. still gonna pick 4 numbers
    @player_color = []
    @bot_color = []
  end
  
  def set_bot_colors
    uniq_color = @color[rand(0..7)] 
    @bot_color << uniq_color unless @bot_color.include?(uniq_color)
  end

  def set_player_colors
    puts "pick a number from 1 to 8: "
    @color.each_with_index do |value, index|
      puts "#{index+1}: #{value}"
    end
    @player_color << @color[gets.chomp.to_i - 1]
  end
end