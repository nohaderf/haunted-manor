class Room < ActiveRecord::Base
    belongs_to :monster
    has_many :visited_rooms
    has_many :players, through: :visited_rooms

    def enter_room
        
    end
end