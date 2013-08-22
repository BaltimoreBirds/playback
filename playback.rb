def many_responses(responses)
  responses.each do |word|
    if responses[0] == word
      puts "You said: #{word}"
    elsif responses[-1] == word
      puts "Finally you said #{word}"
    else
      puts "Then you said: #{word}"
    end
  end
  puts "Phew! Glad you got all #{responses.length} of those things off your chest!"
end

def lots_to_say(array)
  string = ""
  while string.downcase != "done"
    string = gets.chomp
    array << string
  end
end

puts "What do you want to say?"
response = gets.chomp

def playback(string)
  if string.downcase == "nothing"
    puts "Ok, fine!"
  elsif string.downcase == "i have a lot to say"
    input_array = []
    puts "Ok, let's hear it!"
    # while string.downcase != "done"
    #   string = gets.chomp
    #   input_array << string
    # end
    lots_to_say(input_array)
    input_array.pop
    many_responses(input_array)
  else
    puts "You said: #{string}"
  end
end

playback(response)


