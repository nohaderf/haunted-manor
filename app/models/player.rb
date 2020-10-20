class Player < ActiveRecord::Base
    #changed relationships a bit
    has_many :rooms
    has_many :monsters, through: :rooms

    def self.start
        sleep(2)
        Player.choose_room
    end

    def self.choose_room
        prompt = TTY::Prompt.new
        hall = Room.find_by(name: "Hall")
        system("clear")
        puts hall.description
        puts "Find your way out of the manor. Fight the monsters."
        room = prompt.select("What room would you like to go to?") do |option|
            option.choice "Kitchen"
            option.choice "Ballroom"
            option.choice "Conservatory"
            option.choice "Library"
            option.choice "Study"
            option.choice "Billiard Room"
            option.choice "Dining Room"
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
        elsif room == "Study"
            Room.enter_room(room)
        elsif room == "Billiard Room"
            Room.enter_room(room)
        elsif room == "Dining Room"
            Room.enter_room(room)
        end
    end

    def save_and_quit
        prompt = TTY::Prompt.new
        quit = prompt.select("Save and quit?") {|option|
        option.choice = "Yes"
        option.choice = "No"
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
        puts "Strength: #{self.strength}"
        puts "Health: #{self.health}"
    end


end