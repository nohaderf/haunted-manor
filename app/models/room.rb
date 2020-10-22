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
        puts "#{@current_room.description} #{moonster.name}" #=> returning as room object
        prompt.keypress("\nContinue...", keys: [:space, :return])
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
            HauntedManorApp.fight
        elsif select == "Run"
            Player.choose_room
        elsif select == "Stats"
            HauntedManorApp.stats
        end
    end

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
                puts "The air never seemed more fresh compared to the stale, stuffy manor."
                puts "You don't know what's awaiting outside, but it's probably a lot better than staying here."
                puts "You take your chance..."
                sleep(1.5)
                puts "You're free!"
                prompt.keypress("\nPress to continue", keys: [:space, :return])
                HauntedManorApp.win
            end
        # end
    end
end