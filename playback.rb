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

def make_spaceless_array(string)
  string.gsub(/\s/, '').split(//)
end

def count_characters(array)
  count={}
  array.each do |char|
    unless count.has_key?(char)
      count[char] = 0
    end
    count[char] += 1
  end
  count
end

def find_second_largest(hash)
  hash.sort_by{|k,v| v}[-2]

end

puts "What do you want to say?"
response = gets.chomp

def playback(string)
  if string.downcase == "nothing"
    puts "Ok, fine!"
  elsif string.downcase == "i have a lot to say"
    input_array = []
    puts "Ok, let's hear it!"
    lots_to_say(input_array)
    input_array.pop
    many_responses(input_array)
  else
    array= make_spaceless_array(string)
    hash=count_characters(array)
    letter= find_second_largest(hash)
    puts "#{letter[0]} is the second most used character in what you said"
    puts "#{letter[0]} was used a total of #{letter[1]} times"
  end
end

playback(response)
