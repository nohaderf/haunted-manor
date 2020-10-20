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
            artii = Artii::Base.new
            artii.asciify('WELCOME')
            puts artii.asciify('WELCOME')
            sleep(0.5)
            puts "...to the Haunted Manor!"
        end
    
    # LOGIN MENU
    
        def self.menu
            prompt = TTY::Prompt.new
            sleep(1.5)
            welcome_menu = prompt.select ("Please log in or create an account") do |option|
                option.choice "Log In"
                option.choice "Create an Account"
            end
            if welcome_menu == "Log In"
                system("clear")
                HauntedManorApp.login
            elsif welcome_menu == "Create an Account"
                system("clear")
                HauntedManorApp.create_account
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
            prompt = TTY::Prompt.new
            puts "Glad you can join us, #{@player.username}."
            select = prompt.select("What would you like to do?") do |option|
                option.choice "New Game"
                option.choice "Update Account"
                option.choice "Delete Account"
                option.choice "Log Out"
            end
            # if select == "New Game"
                
        end
    
    
    
    
    
    
     end #end of class