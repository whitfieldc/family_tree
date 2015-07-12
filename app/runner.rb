require_relative "seed"

puts "No siblings:"
@fam.find_only_children

puts "Grandparent of Robert:"
@fam.find_grandparent("Robert")

puts "No children:"
@fam.find_non_parents