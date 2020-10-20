class Player < ActiveRecord::Base
    #changed relationships a bit
    has_many :rooms
    has_many :visited_rooms
    has_many :rooms, through: :visited_rooms

    def self.start
        puts "Find your way out of the manor. Fight the monsters."
        sleep(2)
        Player.choose_room
    end

    def self.choose_room
        prompt = TTY::Prompt.new
        room = prompt.select("What room would you like to go to?") do |option|
            option.choice = "Kitchen"
            option.choice = "Ballroom"
            option.choice = "Conservatory"
            option.choice = "Library"
            option.choice = "Study"
            option.choice = "Billiard Room"
            option.choice = "Dining Room"
        end
        Room.find{|option| option == room}
        #Room.all.each{|menu| menu.choice = Room.name}
        #not sure if this would work instead of writing out all 8


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