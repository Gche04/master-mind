require_relative "masterMindInternal"

puts "player master mind with computer"
puts "make code or break code?"
puts ""

choice = "non"

until choice == "m" || choice == "b"
    puts "enter m to make code"
    puts "enter b to break code"
    puts ""

    choice = gets
    choice = choice.chomp
end

game = MasterMindInternal.new

if choice == 'm'
    game.computer_break_code
else
    game.computer_make_code
end