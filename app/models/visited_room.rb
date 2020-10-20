class VisitedRoom < ActiveRecord::Base
    belongs_to :room
    belongs_to :player
end