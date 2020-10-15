class Views
    attr_accessor :players, :game
    def initialize
        print "Entre le nom du joueur 1 > "
        @player1 = Player.new(gets.chomp)
        print "\nEntre le nom du joueur 2 > "
        @player2 = Player.new(gets.chomp)
        @players = [@player1, @player2].shuffle
        @game = Morpion.new
    end

    def perform
        while true
            while true
                round = true
                while round
                    round = @game.fill_with_cross(players[0].player_round(@game.map))
                end
                @game.is_win?(@players) ? round = true : break
                while round
                    round = @game.fill_with_circle(players[1].player_round(@game.map))
                end
                @game.is_win?(@players) ? next : break
            end
            puts "\nVoulez-vous rejouer ?"
            loop do
                print "(y, n) > "
                input = gets.chomp
                if input == "y"
                    @game = Morpion.new
                    break
                elsif input == "n"
                    puts MORPIONS_QUIT
                    exit
                else
                    puts "Mauvaise frappe"
                end
            end
        end
    end
end