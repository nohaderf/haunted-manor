class HauntedManorApp
    require 'artii'
    # require 'colorize'
    # require 'colorized_string'
    
        attr_accessor :player, :monster, :room, :visited_room
    
        def run
            welcome
            HauntedManorApp.menu
        end
    
        private
        def welcome
            system("clear")
            puts "Welcome to...."
            sleep(1.15)
            artii = Artii::Base.new
            artii.asciify('THE    HAUNTED    MANOR')
            puts artii.asciify('THE    HAUNTED    MANOR')
        end
    
    # LOGIN MENU
    
        def self.menu
            prompt = TTY::Prompt.new
            sleep(1.25)
            welcome_menu = prompt.select ("Please log in or create an account") do |option|
                option.choice "Log In"
                option.choice "Create an Account"
                option.choice "Quit"
            end
            if welcome_menu == "Log In"
                system("clear")
                HauntedManorApp.login
            elsif welcome_menu == "Create an Account"
                system("clear")
                HauntedManorApp.create_account
            elsif welcome_menu == "Quit"
                exit!
            end
        end
    
    
        def self.create_account
            prompt = TTY::Prompt.new
            boo = prompt.decorate('👻') 
            username = prompt.ask("Please choose a Username.")
            password = prompt.mask("Please choose a Password.", mask: boo)
            player = Player.create(username: username, password: password)
            puts "Congratulations. User created:"
            sleep(1)
            @player = Player.all.find_by(username: username, password: password)
            @player
            HauntedManorApp.player_menu
        end
    
        def self.login
            prompt = TTY::Prompt.new
            boo = prompt.decorate('👻') 
            username = prompt.ask("Username?")
            password = prompt.mask("Password?", mask: boo)
            if Player.find_by(username: username, password: password)
                @player = Player.find_by(username: username, password: password)
                HauntedManorApp.player_menu
            elsif
                system("clear")
                missing_player = prompt.select("Username or Password not found.") do |option|
                    option.choice "Log In"
                    option.choice "Create an Account"
                    system("clear")
                end
             end
            if missing_player == "Log In"
                system("clear")
                HauntedManorApp.login
            elsif missing_player == "Create an Account"
                system("clear")
                HauntedManorApp.create_account
            end
        end
    
        def self.logout
            prompt = TTY::Prompt.new
            @player = nil
            puts "You have logged out."
            prompt.keypress("\nPress to return to main menu.", keys: [:space, :return])
            HauntedManorApp.menu
        end
    
        # PLAYER MENU
        def self.player_menu
            prompt = TTY::Prompt.new
            lantern = prompt.decorate('🎃') 
            puts "Glad you can join us, #{@player.username}."
            select = prompt.select("What would you like to do?") do |option|
                option.choice "New Game"
                option.choice "Update Account"
                option.choice "Delete Account"
                option.choice "All Players"
                option.choice "Log Out"
                option.choice "Quit"
            end
            if select == "New Game"
                Room.all.each {|room| room.monster_id = rand(1..8)}
                Player.start #wherever we want to start the game
            elsif select == "Update Account"
                system("clear")
                username = prompt.ask("Please choose a new Username:")
                password = prompt.mask("Please choose a new Password:", mask: lantern)
                @player.update(username: username, password: password)
                system("clear")
                puts "Your account has been updated."
                prompt.keypress("\nPress to return to player menu.", keys: [:space, :return])
                HauntedManorApp.player_menu
                end
            if select == "New Game"
                Player.start #wherever we want to start the game
                Room.all.each {|room| room.monster_id = rand(1..8)}
            elsif select == "Delete Account"
                @player.destroy
                system("clear")
                puts "Account deleted."
                sleep(1)
                puts "Sorry, to see you go 😈."
                prompt.keypress("\nPress to return to main menu.", keys: [:space, :return])
                HauntedManorApp.menu
            elsif select == "All Players"
                system("clear")
                @all_players = Player.pluck(:username)
                @all_players.join("\n")
                system("clear")
                puts "#{@all_players}"
                prompt.keypress("\nPress to go back.", keys: [:space, :return])
                HauntedManorApp.player_menu
            elsif select == "Log Out"
                system("clear")
                HauntedManorApp.logout
            elsif select == "Quit"
                exit!
            end
        end

        # DEFAULT STARTING SETTINGS
        def self.assign_monster_to_room
            Room.all.each do |room| 
                rand_number = rand(1..8) # to get a random monster number
                # match monster to the monster_number
                session_monster_id = Monster.find_by(number: rand_number).id 
                # so i got the monster_id's.......
                # now i need to assign it to the room (currently nil)
                # @room_inst = Room.all.find_by(monster_id: @session_monster_id)
                room.update(monster_id: session_monster_id) # assign that id to each respective room
            end
        end

        def self.default_health
            @player.update(health: 10)
        end

        # currently irrelevant
        def self.starting_strength
            rand_strength = 1 + rand(6)
            @player.update(strength: rand_strength)
        end

        # # HELPER METHODS
        # ################### Random win #######################################
        def self.fight
            prompt = TTY::Prompt.new
            dice = 1 + rand(6)
            if dice > 3
                puts "It's been stunted!"
                sleep(1)
                puts "You look around for a possible exit."
                Room.exit_check
            else
                HauntedManorApp.health(3) # DUBUG?!!!
                system("clear")
                puts "You're no match!"
                sleep(1)
                puts "Your health has decreased by 3 points."
                sleep(1)
                puts "RUN AWAY!!!"
                prompt.keypress("\nPress to go back", keys: [:space, :return])
                Player.choose_room
            end
        end



        # ######## IF WE WANT TO BASE FIGHTING OFF STRENGTH #################
        # def self.fight
        #     # need to find instance of player and monster
        #     if @player.strength > Monster.all.find_by(strength
        #         Room.exit_check
        #     elsif @player.strength < Monster.strength
        #         HauntedManorApp.health(3)
        #         @player.update(health: update_health)
        #     end
        # end
        #####################################################################
   
        # STATS
        def self.stats
            prompt = TTY::Prompt.new
            system("clear")
            puts "-- STATS -- "
            puts "Username: #{@player.username}"
            puts "Strength: #{@player.strength}"
            puts "Health: #{@player.health}"
            puts "\nFight at your own risk... or never leave."
            prompt.keypress("\nPress enter to go back", keys: [:space, :return])
            Room.fight?
        end
        
        def self.health(num)
            update_health = @player.health - num
            if update_health <= 0
                HauntedManorApp.game_over
            else
                @player.update(health: update_health) 
            end
        end

        def self.game_over
            prompt = TTY::Prompt.new
            system('clear')
            puts "Sorry, #{@player.username}. The monsters are currently feasting on your lifeless body."
            sleep(2)
            select = prompt.select("Would you like to play again?") do |option|
                option.choice "Yes"
                option.choice "No"
            end
            if select == "Yes"
                Player.start #wherever we want to start the game
            elsif select == "No"
                exit!
            end
        end

        def self.win
            prompt = TTY::Prompt.new
            system('clear')
            puts "Congratulations, #{@player.username}!"
            sleep(1)
            puts "You have escaped the Haunted Manor. \n"
            sleep(0.5)
            select = prompt.select("Would you like to play again?") do |option|
                option.choice "Yes"
                option.choice "No"
            end
            if select == "Yes"
                Player.start 
            elsif select == "No"
                exit!
            end
        end
    
    
    
     end #end of class

     