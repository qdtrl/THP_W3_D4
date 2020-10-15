class Views
    attr_accessor :players, :game, :game_counter
    def initialize
        print String.colors
        print "Entre le nom du joueur 1 > ".colorize(:cyan)
        @player1 = Player.new(gets.chomp)
        print "\nEntre le nom du joueur 2 > ".colorize(:cyan)
        @player2 = Player.new(gets.chomp)
        @players = [@player1, @player2].shuffle
        @game = Morpion.new
        @game_counter = 0
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
            @game_counter += 1
            puts "\nVous êtes actuellement à #{@game_counter} parties ! #{@players[0].name} => #{@players[0].counter_win} & #{@players[1].name} => #{@players[1].counter_win}".colorize(:blue)
            puts "Voulez-vous rejouer ?".colorize(:blue)
            loop do
                print "(y, n) > ".colorize(:cyan)
                input = gets.chomp
                if input == "y"
                    @game = Morpion.new
                    break
                elsif input == "n"
                    puts MORPIONS_QUIT
                    exit
                else
                    puts "Mauvaise frappe".colorize(:red)
                end
            end
        end
    end
end