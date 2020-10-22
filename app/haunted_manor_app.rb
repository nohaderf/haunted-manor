class HauntedManorApp
    require 'artii'

    attr_accessor :player, :monster, :room, :visited_room
    
    def run
        welcome
        HauntedManorApp.menu
    end

    def welcome
        system("clear")
        puts "Welcome to..."
        sleep(1.15)
        artii = Artii::Base.new
        artii.asciify('THE    HAUNTED    MANOR')
        puts artii.asciify('THE    HAUNTED    MANOR')
    end

#############################################################
#                       MAIN MENU
#############################################################

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
        username = prompt.ask("Please choose a Username:")
        password = prompt.mask("Please choose a Password:", mask: boo)
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

#############################################################
#                      PLAYER MENU
#############################################################
    
    def self.player_menu
        prompt = TTY::Prompt.new
        lantern = prompt.decorate('🎃') 
        system("clear")
        puts "Glad you can join us, #{@player.username}."
        sleep(1.25)
        select = prompt.select("\nWhat would you like to do?") do |option|
            option.choice "New Game"
            option.choice "Update Account"
            option.choice "Delete Account"
            option.choice "All Players"
            option.choice "Log Out"
            option.choice "Quit"
        end
        if select == "New Game"
            Room.all.each {|room| room.monster_id = rand(1..8)}
            Player.start 
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
            Player.start 
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
            system("clear")
            puts @all_players.join("\n")
            prompt.keypress("\nPress to go back.", keys: [:space, :return])
            HauntedManorApp.player_menu
        elsif select == "Log Out"
            system("clear")
            HauntedManorApp.logout
        elsif select == "Quit"
            exit!
        end
    end

#############################################################
#              NEW GAME DEFAULT SETTINGS
#############################################################

    def self.assign_monster_to_room
        Room.all.each do |room| 
            rand_monster_num = rand(1..8)
            @session_monster_id = Monster.find_by(number: rand_monster_num).id 
            room.update(monster_id: @session_monster_id) 
        end
    end

    def self.default_health
        @player.update(health: 10)
    end

    def self.rand_exit
        rand_room_num = rand(1..8)
        @room_inst = Room.find_by(number: rand_room_num)
        @room_inst.update(exit: true)
    end

    def self.reset_exit
        Room.all.update(exit: false)
    end

#############################################################
#                     STATS & HEALTH
#############################################################

    def self.stats
        prompt = TTY::Prompt.new
        system("clear")
        puts "-- STATS -- "
        puts "Username: #{@player.username}"
        # puts "Strength: #{@player.strength}"
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

#############################################################
#                      END OF GAME
#############################################################
    
    def self.game_over
        system('clear')
        puts "Sorry, #{@player.username}. The monsters are currently feasting on your lifeless body."
        sleep(2)
        HauntedManorApp.play_again?
    end

    def self.win
        system('clear')
        puts "Congratulations, #{@player.username}!"
        sleep(1.5)
        puts "You have escaped the Haunted Manor."
        sleep(1.5)
        HauntedManorApp.play_again?
    end

    def self.play_again?
        prompt = TTY::Prompt.new
        select = prompt.select("\nWould you like to play again?") do |option|
            option.choice "Yes"
            option.choice "No"
            option.choice ">> Player Menu"
        end
        if select == "Yes"
            Player.start 
        elsif select == "No"
            exit!
        elsif select == ">> Player Menu"
            HauntedManorApp.player_menu
        end
    end
 end #end of class