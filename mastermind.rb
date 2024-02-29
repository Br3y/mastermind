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
    # to check how close codebreaker at winning
    @result = []
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

  def evaluate_guess
    @result.clear
    @player_color.each_with_index do |play, i|
      @bot_color.each_with_index do |bot, j|
        if play == bot
          @result.push(i == j ? "red" : "white")
        end
      end
    end
    puts "stats: #{@result}"
  end

  def display_winner
    if @guess > 12
      abort "Game Over. CodeMaker Wins!"
    end

    if @player_color == @bot_color
      abort "CodeBreaker Wins!"
    end
  end

end

class GameRunner
  def self.run
    loop do
      print "Would you like to become CodeMaker or CodeBreaker( M/B )?: "
      player = gets.chomp.to_s.upcase
      game = MasterMindGame.new(player)

      if player == "M"
        play_maker(game)
      elsif player == "B"
        play_breaker(game)
      else 
        puts "Invalid Input. Try Again"
      end
    end
  end

  def self.play_maker(game)
    loop do

      until game.player_color.length == 4
        game.set_player_colors 
      end

      game.bot_color.clear
      until game.bot_color.length == 4
        game.set_bot_colors
      end

      puts "maker: #{game.player_color}"
      puts "breaker: #{game.bot_color}"
      game.evaluate_guess

      game.display_winner

      game.guess += 1
    end 
  end

  def self.play_breaker(game)
    loop do

      game.player_color.clear
      until game.player_color.length == 4
        game.set_player_colors 
      end

      until game.bot_color.length == 4
        game.set_bot_colors
      end

      puts "maker: #{game.bot_color}"
      puts "breaker: #{game.player_color}"
      
      game.evaluate_guess
      game.display_winner

      game.guess += 1
    end 
  end
end

GameRunner.run