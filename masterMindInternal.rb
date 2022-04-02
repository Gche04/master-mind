require_relative "masterMindModule"

class MasterMindInternal
    include Select
    @@COLOURS = {1 => "blue", 2 => "green", 3 => "red", 4 => "pink", 5 => "orange", 6 => "brown", 7 => "purple"}

    def initialize
        @computer_sel = []
        @player_sel = []
        @result = []
        @lose = true
    end

    def computer_make_code
        set_comp_sel
        lose = true

        for a in 1..12
            @result = []
            puts "try #{a}"

            @player_sel = player_pick(@@COLOURS)
            @result = check(@player_sel, @computer_sel)

            @result.select{ |value| @result.delete(value) if value == nil}

            puts "Total failure" if @result.empty?()
            puts @result.shuffle unless @result.empty?()
            puts ""

            if all_black("Player", @result)
                @lose = false
                break
            end
            
        end
        puts "Player lose!!" if @lose
        puts ""
        puts "code = "
        puts @computer_sel
        puts ""
    end

    def computer_break_code
        @player_sel = player_makes_code(@@COLOURS)
        rand_pick = create_num_arr(@@COLOURS.length)
        
        for a in 1..12
            puts "try #{a}"

            for i in 0..3
                if @result[i] == "black"
                    rand_pick.delete(@@COLOURS.key(@computer_sel[i]))
                    next

                elsif @result[i] == nil
                    unless @computer_sel.empty?
                        rand_pick.delete(@@COLOURS.key(@computer_sel[i]))
                        @computer_sel[i] = @@COLOURS[rand_pick.sample]
                    end
                    @computer_sel[i] = @@COLOURS[rand_pick.sample] if @computer_sel.empty?

                else
                    @computer_sel[i] = @@COLOURS[rand_pick.sample]
                end
            end
            
            puts "computer selection is #{@computer_sel}"
            @result = check(@computer_sel, @player_sel)

            puts @result.shuffle 

            puts "Total failure by computer" if @result.all? nil 
            puts ""

            if all_black("Computer", @result)
                @lose = false
                break
            end
        end

        puts "Computer lose!!" if @lose
    end


    private
    def set_comp_sel
        @computer_sel = computer_makes_code(@@COLOURS)
    end
end
