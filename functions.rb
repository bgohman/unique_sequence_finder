def ask_user_for_dictionary
  puts "\nSelect a dictionary: sample, small, medium, final"
  response = gets.chomp
  case response
  when "sample"
    dictionary = File.open("dictionaries/sample_dictionary.txt", "r")
  when "small"
    dictionary = File.open("dictionaries/small_dictionary.txt", "r")
  when "medium"
    dictionary = File.open("dictionaries/medium_dictionary.txt", "r")
  when "final"
    dictionary = File.open("dictionaries/dictionary.txt", "r")
  else
    puts "That response is not recognized.  Processing the sample dictionary..."
    dictionary = File.open("dictionaries/sample_dictionary.txt", "r")
  end
  return dictionary
end

def find_unique_sequences(dictionary)

  input_words = dictionary.readlines.map(&:chomp)
  full, result = {}, {}
  input_words.each do |word|
    if word[/[a-zA-Z]+/] == word
      c = find_sequences_in_word(word)
      c.each do |seq|
        if full[seq]
          result.store(seq, "duplicate")
        else
          result.store(seq, word)
          full.store(seq, word)
        end
        result.delete_if { |k,v| v == "duplicate" }
        #result = Hash[result.sort]
      end
    end
  end
  result
end

def find_sequences_in_word(word)
  word.chars.to_a.each_cons(4).to_a.map { |seq| seq.join("") }
end

def write_to_output_files(unique_sequences, sequences, words)
  unique_sequences.each do |k,v|
    sequences << "#{k}\n"
    words << "#{v}\n"
  end
end