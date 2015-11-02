#!/usr/bin/env ruby

require_relative('functions')

puts "\n*** Solution to the Words Test *** "
puts "\ngiven a dictionary, generate two output files: 'sequences' and 'words'."
puts "'sequences' contains every sequence of four letters (A-z) that appears in"
puts "exactly one word of the dictionary, one sequence per line."
puts "'words' contains the corresponding words that contain the sequences, in the"
puts "same order, again one per line"

dictionary = ask_user_for_dictionary
sequences, words = File.open("output/sequences.txt", "w"), File.open("output/words.txt", "w")

unique_sequences = find_unique_sequences(dictionary)

write_to_output_files(unique_sequences, sequences, words)

dictionary.close
sequences.close
words.close

puts "sequences.txt and words.txt have been saved in the output directory"