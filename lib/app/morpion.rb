# frozen_string_literal: true

class Morpion
  attr_accessor :map
  def initialize
    @map = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
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
    if @map[cursor[0]][cursor[1]] == '-'
      @map[cursor[0]][cursor[1]] = 'X'.colorize(:yellow)
      false
    else
      puts " \n/!\\ Tu ne peux mettre une croix sur une case pleine ! /!\\".colorize(:red)
      sleep 3
      true
    end
  end

  def fill_with_circle(cursor)
    if @map[cursor[0]][cursor[1]] == '-'
      @map[cursor[0]][cursor[1]] = 'O'.colorize(:green)
      false
    else
      puts "\n/!\\ Tu ne peux mettre un cercle sur une case pleine ! /!\\".colorize(:red)
      sleep 3
      true
    end
  end

  def is_win?(players)
    if is_full?(@map)
      players[0].add_win_counter
      players[1].add_win_counter
      puts "\nEgalitée !"
      false
    elsif (@map[0][0] == 'O'.colorize(:green) && @map[0][1] == 'O'.colorize(:green) && @map[0][2] == 'O'.colorize(:green)) || (@map[1][0] == 'O'.colorize(:green) && @map[1][1] == 'O'.colorize(:green) && @map[1][2] == 'O'.colorize(:green)) || (@map[2][0] == 'O'.colorize(:green) && @map[2][1] == 'O'.colorize(:green) && @map[2][2] == 'O'.colorize(:green))
      puts "\n#{players[1].name} a gagné.e !".colorize(:green)
      players[1].add_win_counter
      false
    elsif (@map[0][0] == 'X'.colorize(:yellow) && @map[0][1] == 'X'.colorize(:yellow) && @map[0][2] == 'X'.colorize(:yellow)) || (@map[1][0] == 'X'.colorize(:yellow) && @map[1][1] == 'X'.colorize(:yellow) && @map[1][2] == 'X'.colorize(:yellow)) || (@map[2][0] == 'X'.colorize(:yellow) && @map[2][1] == 'X'.colorize(:yellow) && @map[2][2] == 'X'.colorize(:yellow))
      players[0].add_win_counter
      puts "\n#{players[0].name} a gagné.e !".colorize(:yellow)
      false
    elsif (@map[0][0] == 'O'.colorize(:green) && @map[1][0] == 'O'.colorize(:green) && @map[2][0] == 'O'.colorize(:green)) || (@map[0][1] == 'O'.colorize(:green) && @map[1][1] == 'O'.colorize(:green) && @map[2][1] == 'O'.colorize(:green)) || (@map[0][2] == 'O'.colorize(:green) && @map[1][2] == 'O'.colorize(:green) && @map[2][2] == 'O'.colorize(:green))
      players[1].add_win_counter
      puts "\n#{players[1].name} a gagné.e !".colorize(:green)
      false
    elsif (@map[0][0] == 'X'.colorize(:yellow) && @map[1][0] == 'X'.colorize(:yellow) && @map[2][0] == 'X'.colorize(:yellow)) || (@map[0][1] == 'X'.colorize(:yellow) && @map[1][1] == 'X'.colorize(:yellow) && @map[2][1] == 'X'.colorize(:yellow)) || (@map[0][2] == 'X'.colorize(:yellow) && @map[1][2] == 'X'.colorize(:yellow) && @map[2][2] == 'X'.colorize(:yellow))
      players[0].add_win_counter
      puts "\n#{players[0].name} a gagné.e !".colorize(:yellow)
      false
    elsif (@map[0][0] == 'O'.colorize(:green) && @map[1][1] == 'O'.colorize(:green) && @map[2][2] == 'O'.colorize(:green)) || (@map[2][0] == 'O'.colorize(:green) && @map[1][1] == 'O'.colorize(:green) && @map[0][2] == 'O'.colorize(:green))
      puts "\n#{players[1].name} a gagné.e !".colorize(:green)
      players[1].add_win_counter
      false
    elsif (@map[0][0] == 'X'.colorize(:yellow) && @map[1][1] == 'X'.colorize(:yellow) && @map[2][2] == 'X'.colorize(:yellow)) || (@map[2][0] == 'X'.colorize(:yellow) && @map[1][1] == 'X'.colorize(:yellow) && @map[0][2] == 'X'.colorize(:yellow))
      puts "\n#{players[0].name} a gagné.e !".colorize(:yellow)
      players[0].add_win_counter
      false
    else
      true
    end
  end

  def is_full?(map)
    3.times do |i|
      3.times do |j|
        return false if map[i][j] == '-'
      end
    end
    true
  end
end
