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
    end
end