
module Select
    def computer_makes_code(colors)
        selected_colors = []

        not_picked = create_num_arr(colors.length)
        
        for i in 0..3
            rand_num = not_picked.sample
            not_picked.delete(rand_num)
            selected_colors << colors[rand_num]
        end
        selected_colors
    end 
    
    def player_pick(colors)
        player_selection = []
        puts ""
        puts "input number to pick colour #{colors}"

        for i in 0..3
            color = input
            puts colors[color]
            puts ""

            until color <= colors.length && color >= 1
                puts "pick number to indicate colour #{colors}"
                puts ""
                color = input
                puts colors[color]
                puts ""
            end
            player_selection << colors[color]
        end
        player_selection
    end

    def player_makes_code(colors)
        player_selection = []
        arr_hold_picks = []
        puts ""
        puts "input number to pick colour #{colors}"

        for i in 0..3
            color = input
            puts colors[color]
            puts ""
            
            while arr_hold_picks.include? color
                puts "dont repeat color"
                puts ""
                color = input
                puts colors[color]
                puts ""
            end

            until color <= colors.length && color >= 1
                puts "pick number to indicate colour #{colors}"
                puts ""
                color = input
                puts colors[color]
                puts ""
            end
            player_selection << colors[color]
            arr_hold_picks << color
        end
        player_selection
    end

    def check(breaker, maker)
        res = Array.new(4)
        for i in 0..breaker.length
            if maker.include? breaker[i]
                if breaker[i] == maker[i]
                    res[i] = "black"
                else
                    res[i] = "white"                       
                end
            end
        end
        res
    end

    def create_num_arr(num)
        rand_arr = []
        for i in 1..num
            rand_arr << i
        end
        rand_arr
    end

    private
    def input
        input = gets
        input = input.chomp.to_i
    end

    def all_black(info, res)
        if res.all? "black"
            puts "#{info} wins!!!"
            return true
        end
        false
    end
end