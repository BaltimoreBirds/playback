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

responses = ["a","b","c"]

many_responses(responses)

array = []
def lots_to_say(array)
  while string.downcase != "done"
    string = gets.chomp
    array << string
  end
end

lots_to_say()
