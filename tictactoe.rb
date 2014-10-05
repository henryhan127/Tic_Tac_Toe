def initialize_positions
  positions = {}  
  (1..9).each{|num| positions[num] = " " }
  positions
end

def draw_board(positions) 
  puts "#{positions[1]} | #{positions[2]}| #{positions[3]} "
  puts '--+--+--'
  puts "#{positions[4]} | #{positions[5]}| #{positions[6]} "
  puts '--+--+--'
  puts "#{positions[7]} | #{positions[8]}| #{positions[9]} "
  puts ""
end

def say(message)
  puts "=>"+ message + "." 
end


def check_winner(positions)
  winning_case = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_case.each do |arr|
    if positions[arr[0]] == "X" && positions[arr[1]] == "X" && positions[arr[2]] == "X" 
      return "Player"  
    elsif positions[arr[0]] == "O" && positions[arr[1]] == "O" && positions[arr[2]] == "O" 
      return "Computer"
    end
  end
  nil
end

positions = initialize_positions
draw_board(positions) # draw the board

begin 
  empty_positions = positions.select{|k,v| v == " "}.keys # define empty positions 
  begin # player picks an empty position
    say "Empty positions are #{empty_positions}"
    say "Pick one of the empty positions"
    player_choice = gets.chomp.to_i
    if empty_positions.include?(player_choice) != true
      say "#{player_choice} is not an empty position"
    end
  end until empty_positions.include?(player_choice)
  positions[player_choice] = "X"
  winner = check_winner(positions)
  draw_board(positions) # draw the board
  

  empty_positions = positions.select{|k,v| v == " "}.keys # define empty positions
    
  
  computer_choice = empty_positions.sample # computer picks an empty position
  positions[computer_choice] = "O"
  winner = check_winner(positions)
  draw_board(positions) # draw the board 

end until check_winner(positions) || empty_positions.empty?



if check_winner(positions) 
  say "#{check_winner(positions)} won"
else
  say "It's a tie"
end