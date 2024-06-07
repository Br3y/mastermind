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