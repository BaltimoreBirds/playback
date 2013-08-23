console_output = {
  first: "You said: ",
  middle: "Then you said: ",
  last: "Finally you said: ",
  question: "What do you want to say?",
  multiples: "Ok, let's hear it!",
  nothing: "Ok, fine!",
  input_nothing: "nothing",
  input_multiples: "i have a lot to say",
  done: "done",
  count: "%s is the second most used character in what you said",
  count2: "%s was used a total of %s times",
  prepared: "i have something prepared",
  filepath: "Ok, where can I find what you want to say?",
  invalid_file: "I couldn't find that file.",
  filepath2: "Where can I find what you want to say?",
  reading: "Reading %s ..."
}

def first_in_array(array)
  array[0]
end

def last_in_array(array)
  array[-1]
end

def strip_array(array)
  array[1...-1]
end

def collect_responses(responses, console_output)
  speech = []
  responses.each do |word|
    if first_in_array(responses)
      speech << console_output[:first] + word
    elsif last_in_array(responses)
      speech << console_output[:last] + word
    else
      speech << console_output[:middle] + word
    end
  end
  speech
end

def collect_input(array, console_output)
  string = ""
  while string.downcase != console_output[:done]
    string = gets.chomp
    array << string
  end
  array
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

def get_file_path
gets.chomp
end

def read_file(file)
  File.open(file, 'r') {|f| puts f.read}
end

def validate_file_name(file)
  !file.include?(".txt")
end


def collect_playback(string, console_output)
  echo = []
  if string.downcase == console_output[:input_nothing]
    echo << console_output[:nothing]
  elsif string.downcase == console_output[:input_multiples]
    puts console_output[:multiples]
    input_array = []
    collect_input(input_array, console_output)
    input_array.pop
    echo << collect_responses(input_array, console_output)
  elsif string.downcase == console_output[:prepared]
    puts console_output[:filepath]
    file = get_file_path
    while validate_file_name(file)
      puts console_output[:invalid_file]
      puts console_output[:filepath2]
      file = get_file_path
    end
    puts console_output[:reading] % file
    echo << read_file(file)
  else
    array= make_spaceless_array(string)
    hash=count_characters(array)
    letter= find_second_largest(hash)
    echo << console_output[:count] % letter
    echo << console_output[:count2] % letter
    echo << console_output[:first] + string
  end
  echo
end


puts console_output[:question]
response = gets.chomp
puts collect_playback(response, console_output)



