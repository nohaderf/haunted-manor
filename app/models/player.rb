class Player < ActiveRecord::Base
    has_many :rooms
    has_many :monsters, through: :rooms
end