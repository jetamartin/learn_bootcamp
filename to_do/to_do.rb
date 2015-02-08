require 'rspec'
require 'pg'
require_relative 'lib/list'
require_relative 'lib/task'

DB = PG.connect({:dbname => 'to_do_test'})

def welcome_msg
  puts "-----------------------------------------------------------------------"
  puts "| Welcome to the ToDo list application!                               |"
  display_command_options
  puts "| Now you can enter your commands at the command prompt               |"
  puts "-----------------------------------------------------------------------"

end

def display_command_options
  puts "***********************************************************************"
  puts " Your valid command options are as follows:                           *
  lists                  - show me all of my lists                            *
  list 'x'               - select the list 'x'                                *
  task 'x'               - select the task 'x' to view                        *
  complete 'x'           - mark task 'x' as complete                          *
  new 'listname'         - create a new list and name it 'listname'           *
  help?                  - show me the list of valid commands                 *
  quit                   - exits out of the application                       *"
  puts "***********************************************************************"
end

def goodbye_msg
  puts "\n\n *********** Thanks for using the application! Later gator! ************\n\n"
end

def coming_soon_msg
  puts "This functionality has been implemented yet"
end

# Dialog loop

welcome_msg
loop do
  puts "command?"
  user_input = gets.chomp
  user_command = user_input.split /\s+/

  case user_command[0]

  when "lists"
    # Retrieve set of list from DB using self.all Class Method
    lists=[]
    lists = List.all
    if lists.length != 0
      lists.each {|e| puts "#{e}"}
    else
      puts "No lists exist"
    end

  when "list x"
    coming_soon_msg

  when "tasks"
    coming_soon_msg

  when "complete"
    coming_soon_msg

  when "new"
    coming_soon_msg

  when "help"
    display_command_options

  when "quit"
    goodbye_msg
    exit
  else
    puts "******** The command #{user_command} you entered is not valid *******"
  end
end
