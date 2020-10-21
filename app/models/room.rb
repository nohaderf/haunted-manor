class Room < ActiveRecord::Base
    belongs_to :monster
    has_many :visited_rooms
    has_many :players, through: :visited_rooms

    def self.enter_room(room)
        system("clear")
        prompt = TTY::Prompt.new
        current_room = Room.find_by(name: room)
        moonster = Monster.find_by(id: current_room.monster_id).name
        system("clear")
        puts current_room.description
        puts moonster
        Room.fight
    end

    def self.fight
        system("clear")
        prompt = TTY::Prompt.new
        select = prompt.select("What would you like to do?") do |option|
            option.choice "Fight"
            option.choice "Run"
            option.choice "Stats"
        end
        if select == "Fight"
            if @player.strength > Monster.find_by(id: current_room.monster_id).strength
                Room.exit_check
            elsif @player.strength < Monster.find_by(id: current_room.monster_id).strength
                new_health = @player.health - 3
                @player.update(health: new_health)
            end
        elsif select == "Run"
        elsif select == "Stats"
            system("clear")
            @player.stats
            #idk how to get the players stats here
            select = prompt.select do |option|
                option.choice "Go Back"
            end
            if select == "Go Back"
                self.fight
            end
        end
    end

    def self.exit_check
        system("clear")
    end
end