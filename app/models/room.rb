class Room < ActiveRecord::Base
    belongs_to :monster
    has_many :visited_rooms
    has_many :players, through: :visited_rooms

    def self.enter_room(room)
        system("clear")
        prompt = TTY::Prompt.new
        puts Room.find_by(name: room).description
    end
end