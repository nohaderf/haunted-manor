class Room < ActiveRecord::Base
    belongs_to :monster
    has_many :visited_rooms
    has_many :players, through: :visited_rooms



    def self.enter_room(room)
        system("clear")
        prompt = TTY::Prompt.new
        @current_room = Room.find_by(name: room)
        moonster = Monster.find_by(id: @current_room.monster_id) 
        system("clear")
        puts "#{@current_room.description} #{moonster.name}." #=> returning as room object
        prompt.keypress("\nPress to continue...", keys: [:space, :return])
        Room.fight?
    end

    def self.fight?
        system("clear")
        prompt = TTY::Prompt.new
        select = prompt.select("What would you like to do?") do |option|
            option.choice "Fight"
            option.choice "Run"
            option.choice "Stats"
        end
        if select == "Fight"
            Room.fight_on
        elsif select == "Run"
            Player.choose_room
        elsif select == "Stats"
            HauntedManorApp.stats
        end
    end


    def self.fight_on
        prompt = TTY::Prompt.new
        dice = 1 + rand(6)
        if dice > 3
            puts "It's been stunted!"
            sleep(1)
            puts "You look around for a possible exit."
            Room.exit_check
        else
            HauntedManorApp.health(3) 
            system("clear")
            puts "You're no match!"
            sleep(1)
            puts "Your health has decreased by 3 points."
            sleep(1)
            puts "RUN AWAY!!!"
            prompt.keypress("\nPress to go back", keys: [:space, :return])
            Player.choose_room
        end
    end


        # ######## IF WE WANT TO BASE FIGHTING OFF STRENGTH #################
        # def self.fight
        #     # need to find instance of player and monster
        #     if @player.strength > Monster.all.find_by(strength
        #         Room.exit_check
        #     elsif @player.strength < Monster.strength
        #         HauntedManorApp.health(3)
        #         @player.update(health: update_health)
        #     end
        # end
        #####################################################################

    def self.exit_check
        system("clear")
        prompt = TTY::Prompt.new
        # Room.all.each do |room| 
            if @current_room.exit == false
                system("clear")
                puts "You're barricaded. It's best to try other rooms."
                prompt.keypress("\nPress to go back", keys: [:space, :return])
                Player.choose_room
            elsif @current_room.exit == true
                system("clear")
                puts "As you approach the window, you welcome a slight breeze touching you skin."
                sleep(1.25)
                puts "The air never seemed more fresh compared to the stale, stuffy manor."
                sleep(1.25)
                puts "You don't know what's awaiting outside, but it's probably a lot better than staying here."
                sleep(1.25)
                puts "You take your chance..."
                sleep(2)
                puts "You're free!"
                prompt.keypress("\nPress to continue", keys: [:space, :return])
                HauntedManorApp.win
            end
        # end
    end
end