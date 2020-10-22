class Room < ActiveRecord::Base
    belongs_to :monster
    has_many :visited_rooms
    has_many :players, through: :visited_rooms



    def self.enter_room(room)
        system("clear")
        prompt = TTY::Prompt.new
        current_room = Room.find_by(name: room)
        system("clear")
        puts current_room.description
        puts current_room.monster
        prompt.keypress("\nContinue...", keys: [:space, :return])
        Room.fight?
    end

    # ####### TRYING TO RANDOMIZE MONSTERS ##########
    # def rand_id
    #     @rand_id = rand(Monster.count)
    #     @moonster = Monster.rand_id(rand_id).first
    # end

    # rand_number = rand(1..8) # to get a random monster number
    # @session_monster_id = Monster.all.where(number: rand_number).ids # match monster to the monster_number
    # # so i got the monster_id's.......
    # # now i need to assign it to the room (currently nil)
    # Room.monster_id = @session_monster_id # assign that id to each respective room

    # ########### HARD CODING :( ###################

    # if @curent_room == "Kitchen"
    #     Room.ghost
    # elsif @curent_room == "Ballroom"
    #     Room.ghost
    # elsif @curent_room == "Conservatory"
    #     Room.vampire
    # elsif @curent_room == "Library"
    #     Room.zombie
    # elsif @curent_room == "Lounge"
    #     Room.ghost
    # elsif @curent_room == "Study"
    #     Room.vampire
    # elsif @curent_room == "Billiard Room"
    #     Room.enter_room(room)
    # elsif @curent_room == "Dining Room"
    #     Room.ghost
    # end

    # def ghost
    #     puts "#{@current_room.description} + ghost!"
    #     Room.fight?
    # end

    # def vampire
    #     puts "#{@current_room.description} + vampire!"
    #     Room.fight?
    # end

    # def zombie
    #     puts "#{@current_room.description} + ghost!"
    #     Room.fight?
    # end

    # ##############################################

    def self.fight?
        system("clear")
        prompt = TTY::Prompt.new
        select = prompt.select("What would you like to do?") do |option|
            option.choice "Fight"
            option.choice "Run"
            option.choice "Stats"
        end
        if select == "Fight"
            HauntedManorApp.fight
        elsif select == "Run"
            Player.choose_room
        elsif select == "Stats"
            HauntedManorApp.stats
        end
    end

    def self.exit_check
        system("clear")
        Room.all.each do |room| 
            if room.exit == false
                puts "You're barricaded. It's best to try other rooms."
                prompt.keypress("\nPress to go back", keys: [:space, :return])
                Player.choose_room
            elsif room.exit == true
                puts "As you approach the window, you welcome a slight breeze touching you skin."
                puts "The air never seemed more fresh compared to the stale, stuffy manor."
                puts "You don't know what's awaiting outside, but it's probably a lot better than staying here."
                puts "You take your chance..."
                sleep(1.5)
                puts "You're free!"
                prompt.keypress("\nPress to continue", keys: [:space, :return])
                HauntedManorApp.Win
            end
        end
    end
end