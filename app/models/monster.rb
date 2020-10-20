class Monster < ActiveRecord::Base
    has_many :rooms
    has_many :players, through: :rooms
end