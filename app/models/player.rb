class Player < ActiveRecord::Base
    has_many :rooms
    has_many :monsters, through: :rooms

    def self.start
        HauntedManorApp.default_health
        HauntedManorApp.assign_monster_to_room
        HauntedManorApp.rand_exit
        Player.intro
    end

    def self.intro
        prompt = TTY::Prompt.new
        hall = Room.find_by(name: "Hall")
        system("clear")
        puts hall.description
        sleep(1.25)
        prompt.keypress("\nPress to continue...", keys: [:space, :return])
        Player.choose_room
    end

    def self.choose_room
        prompt = TTY::Prompt.new
        system("clear")
        puts "Find your way out of the manor. Fight the monsters. \n \n"
        sleep(1.5)
        room = prompt.select("Which room would you like to explore?") do |option|
            option.choice "Kitchen"
            option.choice "Ballroom"
            option.choice "Conservatory"
            option.choice "Library"
            option.choice "Lounge"
            option.choice "Study"
            option.choice "Billiard Room"
            option.choice "Dining Room"
            option.choice ">> Quit"
        end
        #Room.find{|option| option == room}
        #Room.all.each{|menu| menu.choice = Room.name}
        #not sure if this would work instead of writing out all 8
        if room == "Kitchen"
            Room.enter_room(room)
        elsif room == "Ballroom"
            Room.enter_room(room)
        elsif room == "Conservatory"
            Room.enter_room(room)
        elsif room == "Library"
            Room.enter_room(room)
        elsif room == "Lounge"
            Room.enter_room(room)
        elsif room == "Study"
            Room.enter_room(room)
        elsif room == "Billiard Room"
            Room.enter_room(room)
        elsif room == "Dining Room"
            Room.enter_room(room)
        elsif room == ">> Quit"
            Player.quit
        end
    end

    def self.quit
        system("clear")
        prompt = TTY::Prompt.new
        quit = prompt.select("Quit the game?") {|option|
        option.choice "Yes"
        option.choice "No"
        }
        if quit == "Yes"
            system("clear")
            HauntedManorApp.menu
        elsif quit == "No"
            system("clear")
            HauntedManorApp.player_menu
        end
    end
    
    def stats
        prompt = TTY::Prompt.new
        system("clear")
        puts "Stats"
        puts "Username: #{self.username}"
        puts "Health: #{self.health}"
    end

end # end of class