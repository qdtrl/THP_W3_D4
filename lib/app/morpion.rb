class Morpion
    attr_accessor :map
    def initialize
        @map = [["-", "-", "-"],["-", "-", "-"],["-", "-", "-"]]
    end

    def self.map
        @map
    end

    def show_map
        3.times do |i|
            3.times do |j|
                print " #{@map[i][j]} "
            end
            print "\n\n"
        end
    end

    def fill_with_cross(cursor)
        if @map[cursor[0]][cursor[1]] == "-"
            @map[cursor[0]][cursor[1]] = "X"
            return false
        else
            puts " \n/!\\ Tu ne peux mettre une croix sur une case pleine ! /!\\"
            sleep 3
            return true
        end
    end

    def fill_with_circle(cursor)
        if @map[cursor[0]][cursor[1]] == "-"
            @map[cursor[0]][cursor[1]] = "O"
            return false
        else
            puts "\n/!\\ Tu ne peux mettre un cercle sur une case pleine ! /!\\"
            sleep 3
            return true
        end
    end

    def is_win?(players)
        if is_full?(@map)
            puts "\nEgalitée !"
            return false
        elsif (@map[0][0] == "O" && @map[0][1] == "O" && @map[0][2] == "O") || (@map[1][0] == "O" && @map[1][1] == "O" && @map[1][2] == "O") || (@map[2][0] == "O" && @map[2][1] == "O" && @map[2][2] == "O")
            puts "\n#{players[1].name} a gagné.e !"
            return false
        elsif (@map[0][0] == "X" && @map[0][1] == "X" && @map[0][2] == "X") || (@map[1][0] == "X" && @map[1][1] == "X" && @map[1][2] == "X") || (@map[2][0] == "X" && @map[2][1] == "X" && @map[2][2] == "X")
            puts "\n#{players[0].name} a gagné.e !"
            return false
        elsif (@map[0][0] == "O" && @map[1][0] == "O" && @map[2][0] == "O") || (@map[0][1] == "O" && @map[1][1] == "O" && @map[2][1] == "O") || (@map[0][2] == "O" && @map[1][2] == "O" && @map[2][2] == "O")
            puts "\n#{players[1].name} a gagné.e !"
            return false
        elsif (@map[0][0] == "X" && @map[1][0] == "X" && @map[2][0] == "X") || (@map[0][1] == "X" && @map[1][1] == "X" && @map[2][1] == "X") || (@map[0][2] == "X" && @map[1][2] == "X" && @map[2][2] == "X")
            puts "\n#{players[0].name} a gagné.e !"
            return false
        elsif (@map[0][0] == "O" && @map[1][1] == "O" && @map[2][2] == "O") || (@map[2][0] == "O" && @map[1][1] == "O" && @map[0][2] == "O")
            puts "\n#{players[1].name} a gagné.e !"
            return false
        elsif (@map[0][0] == "X" && @map[1][1] == "X" && @map[2][2] == "X") || (@map[2][0] == "X" && @map[1][1] == "X" && @map[0][2] == "X")
            puts "\n#{players[0].name} a gagné.e !"
            return false
        else
            return true
        end
    end

    def is_full?(map)
        3.times do |i|
            3.times do |j|
                if map[i][j] == "-"
                    return false
                end
            end
        end
        return true
    end
end