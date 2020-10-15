class Player
    attr_accessor :name
    def initialize(name)
        @name = name
    end

    def self.name
        @name
    end

    def player_round(map)
        cursor = [1,1]
        move = ""
        while move != " "
            system("clear")
            puts MORPIONS_GAMES 
            show_map_with_cursor_position(map, cursor)
            print "\n\n" + "-" * 41 + "\n"
            puts "Bouge avec w, s, a, d et valide avec \" \" puis presse Entrer !"
            print "\n#{@name} est entrain de jouer > "
            move = gets.chomp
            case move
            when "d"
                cursor[1] < 2 ? cursor[1] += 1 : next
            when "a"
                cursor[1] > 0 ? cursor[1] -= 1 : next
            when "s"
                cursor[0] < 2 ? cursor[0] += 1 : next
            when "w"
                cursor[0] > 0 ? cursor[0] -= 1 : next
            when " "
                return cursor
            else
                puts "\n/!\\     Mauvaise frappe    /!\\"
                sleep 2
            end
        end
    end
        
    def show_map_with_cursor_position(map, cursor)
        und = false
        3.times do |i|
            print "\n"
            3.times do |j|
                print " #{map[i][j]} "
                if [i, j] == cursor
                    und = true
                end
            end
            if und
                print "\n" +(" " * (cursor[1]*3+1)) + "^"
                und = false
            else
                print "\n"
            end
        end
    end





end