puts "What do you want to say?"
response = gets.chomp

def playback(string)
  puts "You said: #{string}"
end

playback(response)
