require_relative '../config/environment'
require "tty-prompt"
prompt = TTY::Prompt.new 

app = HauntedManorApp.new
app.run