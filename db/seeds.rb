Monster.destroy_all
Player.destroy_all
Room.destroy_all

# Monsters (name, strength, number)
monster1 = Monster.create(name: "Mummy", strength: 3, number: 1)
monster2 = Monster.create(name: "Zombie", strength: 4, number: 2)
monster3 = Monster.create(name: "Vampire", strength: 5, number: 3)
monster4 = Monster.create(name: "Clown", strength: 1, number: 4)
monster5 = Monster.create(name: "Witch", strength: 10, number: 5)
monster6 = Monster.create(name: "Dragon", strength: 2, number: 6)
monster7 = Monster.create(name: "Ogre", strength: 2, number: 7)
monster8 = Monster.create(name: "Ghost", strength: 3, number: 8)

# Players (username, password, strength, health)
player1 = Player.create(username: "lee", password: "password", strength: 8, health: 10)
player2 = Player.create(username: "freda", password: "anotherpassword", strength: 6, health: 8)

# Rooms (name, description)
room1 = Room.create(name: "Kitchen", description: "You enter a tiny kitchen, where you notice all of the cabinet’s doors have been ripped off their hinges. \nStains of every color painting the room, only visible from the faint light of the blue flames from the stove top. \nYou hear rustling in the corner. \nThe sounds of pots and pans falling onto each other, hitting the linoleum floor.  \nYou turn your gaze to see a", monster_id: nil, exit: false)
room2 = Room.create(name: "Ballroom", description: "You enter a circular chamber, crystal chandeliers hanging, untouched and pristine as opposed to everything below.  \nFrom shattered mirrors, to ravaged wallpaper, and chairs snapped like twigs all around.  \nIt all paled in comparison to being face to face with a", monster_id: nil, exit: true)
room3 = Room.create(name: "Conservatory", description: "The moonlight shines through the shattered glass of the conservatory, shedding light onto all the foliage retaking control of the land.  \nLeaves and vines, splayed in and out of the once well-kept conservatory as if alive and breathing.  \nYou hear a rustling in the corner, and meeting your eyes is a", monster_id: nil, exit: false)
room4 = Room.create(name: "Dining Room", description: "Dust collected everywhere as far as the could see, spider webs wove loosely around books, dirtied shelves, and stands, The ground was littered with dirt, glass, books, and torn paper.  \nThe crevices in the wall allowed small amounts light to filter inside along with thin ropes of ivy.   \nHearing shuffling, you turn to see a", monster_id: nil, exit: false)
room5 = Room.create(name: "Hall", description: "The ceiling must be twenty feet high. \nDesigns of fire and torture are carved into the moulding and small, demons glaring down at you from every angle. \nThere are 8 doors circling you.", exit: false)
room6 = Room.create(name: "Library", description: "Papers littered the floor circling the desk in the center of the room.  \nRats scurrying and slipping in the dimly lit room at the sound of your entrance.  \nCautiously approaching the desk with only a candle melting away you’re able to see that hiding behind the desk is a", monster_id: nil, exit: false)
room7 = Room.create(name: "Lounge", description: "The rough wear of paintwork and wooden splinters of the door meet you first.  \nSquealing hinges announcing you to the room before you even step a foot in.  \nThe stench of booze and cigarettes assault your sense, where leisuring on the sofa you see", monster_id: nil, exit: false)
room8 = Room.create(name: "Billard Room", description: "Entering you immediately see the billiards table split savagely in half, with the foulest smelling stain coming from where both halves of the table cave into the floor.  \nThe cues are all sticking out of the walls as if they were darts.  \nYou hear the distinct sound of the start of a pool game and see a", monster_id: nil, exit: false)
room9 = Room.create(name: "Study", description: "The table dominated the room.  \nAn elongated ellipse of mahogany with brass at the edges.  \nThe chairs from the same tree.  \nThe table was set and ready for a feast, at least it was at some point in time before all this food became rotted.  \nBut the distinct sounds of eating without remorse can be heard, not stopping to meet your eyes is the", monster_id: nil, exit: false)


# # Visited Rooms (player_id, room_id)
# vr_1 = VisitedRoom.create(player_id: player1.id, room_id: room1.id)
# vr_2 = VisitedRoom.create(player_id: player2.id, room_id: room1.id)