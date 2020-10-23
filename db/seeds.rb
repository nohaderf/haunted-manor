Monster.destroy_all
Player.destroy_all
Room.destroy_all

# Monsters (name, number)
monster1 = Monster.create(name: "Mummy", number: 1)
monster2 = Monster.create(name: "Zombie", number: 2)
monster3 = Monster.create(name: "Vampire", number: 3)
monster4 = Monster.create(name: "Clown", number: 4)
monster5 = Monster.create(name: "Witch", number: 5)
monster6 = Monster.create(name: "Dragon", number: 6)
monster7 = Monster.create(name: "Troll", number: 7)
monster8 = Monster.create(name: "Ghost", number: 8)

# Players (username, password, health)
player1 = Player.create(username: "lee", password: "password", health: nil)
player2 = Player.create(username: "freda", password: "anotherpassword", health: nil)

# Rooms (name, description, monster_id, exit, number)
room1 = Room.create(name: "Kitchen", description: "You enter a tiny kitchen, where you notice all of the cabinet doors have been ripped off their hinges. \nStains of every color painting the room, only visible from the faint light of the blue flames from the stove top. \nYou hear rustling in the corner. \nThe sounds of pots and pans falling onto each other, hitting the linoleum floor.  \nYou turn your gaze to see a", monster_id: nil, exit: false, number: 1)
room2 = Room.create(name: "Ballroom", description: "You enter a circular chamber, crystal chandeliers hanging, untouched and pristine as opposed to everything below.  \nFrom shattered mirrors, to ravaged wallpaper, and chairs snapped like twigs all around.  \nIt all paled in comparison to being face to face with a", monster_id: nil, exit: false, number: 2)
room3 = Room.create(name: "Conservatory", description: "The moonlight shines through the shattered glass of the conservatory, shedding light onto all the foliage retaking control of the land.  \nLeaves and vines, splayed in and out of the once well-kept conservatory as if alive and breathing.  \nYou hear rustling in the corner, and meeting your eyes is a", monster_id: nil, exit: false, number: 3)
room4 = Room.create(name: "Dining Room", description: "The table dominated the room.  \nAn elongated ellipse of mahogany with brass at the edges. The chairs from the same tree.  \nThe table was set and ready for a feast, at least it was at some point in time before all this food became rotted.  \nBut the distinct sounds of eating without remorse can be heard, not stopping to meet your eyes is the", monster_id: nil, exit: false, number: 4)
room5 = Room.create(name: "Hall", description: "The ceiling must be twenty feet high. \nDesigns of fire and torture are carved into the moulding, demons glaring down at you from every angle. \nThere are 8 doors encircling you.", exit: false, number: 9)
room6 = Room.create(name: "Library", description: "Papers littered the floor circling the desk in the center of the room.  \nRats scurrying and slipping in the dimly lit room at the sound of your entrance.  \nCautiously approaching the desk with only a candle melting away, you’re able to see that hiding behind the desk is a", monster_id: nil, exit: false,  number: 5)
room7 = Room.create(name: "Lounge", description: "The rough wear of paintwork and wooden splinters of the door meet you first.  \nSquealing hinges announcing you to the room before you even step a foot in.  \nThe stench of booze and cigarettes assault your sense, where leisuring on the sofa you see a", monster_id: nil, exit: false, number: 6)
room8 = Room.create(name: "Billiard Room", description: "Entering, you immediately see the billiards table split savagely in half, \nwith the foulest smelling stain coming from where both halves of the table cave into the floor.  \nThe cues are all sticking out of the walls as if they were darts.  \nYou hear the distinct sound of the start of a pool game and see a", monster_id: nil, exit: false, number: 7)
room9 = Room.create(name: "Study", description: "Dust collected everywhere as far as the eye could see, spider webs wove loosely around books, dirtied shelves, and stands, The ground was littered with dirt, glass, books, and torn paper.  \nThe crevices in the wall allowed small amounts light to filter inside along with thin ropes of ivy.   \nHearing shuffling, you turn to see a", monster_id: nil, exit: false,  number: 8)