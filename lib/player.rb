class PlayerRunner
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
      game.set_player_colors until game.player_color.length == 4

      game.bot_color.clear
      game.set_bot_colors until game.bot_color.length == 4

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
      game.set_player_colors until game.player_color.length == 4

      game.set_bot_colors until game.bot_color.length == 4

      puts "maker: #{game.bot_color}"
      puts "breaker: #{game.player_color}"

      game.evaluate_guess
      game.display_winner

      game.guess += 1
    end
  end
end
