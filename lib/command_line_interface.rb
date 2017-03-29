require 'random_name_generator'

def ascii
       "      _..----.._    _
            .'  .--.    "" (0)_
'-.__.-'"'=:|   ,  _)_ \__ . c\'-..o
             ''''------''---''''---'
           end

def welcome
  puts "Hello agent, please input your first name!"
  puts "#{ascii}"

end

def create_new_user
  input = gets.chomp
  player = User.create
  player.name = input.capitalize
  player.assign_agent_name
  player.save
  puts "Hello, #{player.name}! Your codename is #{player.agent_name}..."
end

def assign_agent_name
  agent_name = create_new_user.assign_agent_name
  puts "For this dangerous mission, you have been given the codename #{agent_name}."
end

def mission_statement
  puts "-----------------------------------------------------------------------"
  puts "A notorious criminal is posing as a rat in New York City! We've scraped the data from the
  latest 311 calls on rat sightings, so that we can uncover the culprit behind this mastermind scheme! Your job is to
  use the clues from a classified FBI database that we provide you to identify the villain masquerading as a mere NYC rat!"
  puts "-----------------------------------------------------------------------"
end

def options
  puts "Type 'help' to see the rules, 'exit' to leave the game or 'start' to see the first rat!"
  user_input = gets.chomp
  if user_input == 'help'
    help
  elsif user_input == 'start'
    start_game
  elsif user_input == 'exit'
    leave
  else
    puts "I did not understand that command, agent! Please type 'help' or 'start'!"
    user_input
    options
  end
end

def leave
  puts "Goodbye!"
end

def help
  puts "-----------------------------------------------------------------------"
  puts "Pay attention, agent! Your job is to find the criminal that is masquerading as a rat! You will be given
  a list of suspects and a clue to help you narrow your search. You will be given four chances with a new clue each time
  to find the mastermind! If your deductive skills suffice to pinpoint the correct criminal, that criminal will be
  added to your casefile and you will forever be honored! If you are incorrect, the criminal will continue to run
  free and wreak havoc on the city! Each rat is being located in real-time through 311 calls from distraught citizens of New York
  City. You too can report potential criminals pretending to be rats."
  puts "-----------------------------------------------------------------------"
end


def start_game
  game_rat = RatSighting.get_random_rat

  puts "A rat has been spotted at #{game_rat.timestamp}"
  # a rat has been spotted at location on timestamp. It's identifying itself as (pseudonym).
  # Here are a list of notorious criminals who are known to prowl this area. Uncover (pseudonym)'s true identity!
end

def clue_1

end
