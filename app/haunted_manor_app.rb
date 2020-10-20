class HauntedManorApp
    require 'artii'
    # require 'colorize'
    # require 'colorized_string'
    
        attr_reader :player
        # here will be your CLI!
        # it is not an ActiveRecord Class
    
        def run
            welcome
            HauntedManorApp.menu
        end
    
        private
        def welcome
            system("clear")
            puts "Welcome to...."
            sleep(2)
            artii = Artii::Base.new
            artii.asciify('THE HAUNTED MANOR')
            puts artii.asciify('THE HAUNTED MANOR')
        end
    
    # LOGIN MENU
    
        def self.menu
            prompt = TTY::Prompt.new
            sleep(1.5)
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
            @player = nil
            system("clear")
            HauntedManorApp.menu
        end
    
        # PLAYER MENU
        def self.player_menu
            system("clear")
            prompt = TTY::Prompt.new
            lantern = prompt.decorate('🎃') 
            puts "Glad you can join us, #{@player.username}."
            select = prompt.select("What would you like to do?") do |option|
                option.choice "New Game"
                option.choice "Update Account"
                option.choice "Delete Account"
                option.choice "Log Out"
                option.choice "Return to Main Menu"
            end
            if select == "New Game"
                @player.player.start #wherever we want to start the game
            elsif select == "Update Account"
                username = prompt.ask("Please choose a new Username.")
                password = prompt.mask("Please choose a new Password.", mask: lantern)
                @player.update(username: username, password: password)
                system("clear")
                puts "Your account has been updated."
                select = prompt.select("What would you like to do?") do |option|
                    option.choice "New Game"
                    option.choice "Update Account"
                    option.choice "Delete Account"
                    option.choice "Log Out"
                    option.choice "Return to Main Menu"
                end
            elsif select == "Delete Account"
                @player.destroy(username: username, password: password)
                puts "Account deleted."
                sleep(1)
                puts "Sorry, to see you go 😈."
            elsif select == "Log Out"
                HauntedManorApp.logout
            elsif select == "Return to Main Menu"
                HauntedManorApp.menu
            end
        end
    
    

    
    
     end #end of class