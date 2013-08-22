puts "What do you want to say?"
response = gets.chomp

def playback(string)
  if string.downcase == "nothing"
    return "Ok, fine!"
  elsif string.downcase == "i have a lot to say"
    input_array = []
    puts "Ok, let's hear it!"
    while string.downcase != "done"
      string = gets.chomp
      input_array << string
    end
    input_array.pop
    input_array.each do |word|
      puts "You said: #{word}"
    end
  else
    return "You said: #{string}"
  end
end

puts playback(response)
