require_relative "seed"

if ARGV.length == 0
  puts "No siblings:"
  @fam.find_only_children

  puts "Grandparent of Kevin:"
  @fam.find_grandparent("Kevin")

  puts "No children:"
  @fam.find_non_parents

  puts "Proudest Grandparent:"
  @fam.find_proudest_grandparent
else
  case (ARGV[0]).downcase
  when "lonely"
    puts "No siblings:"
    @fam.find_only_children
  when "grandparent"
    grandkid = ARGV[1]
    puts "Grandparent of " + grandkid + ":"
    @fam.find_grandparent(grandkid)
  when "childless"
    puts "No children:"
    @fam.find_non_parents
  when "proudest"
    puts "Proudest grandparent:"
    @fam.find_proudest_grandparent
  else
    puts "Couldn't read command."
  end

end

# puts winner[1].name

# p ARGV