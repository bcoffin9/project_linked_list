require_relative "linked_list.rb"

puts "testing the linked list"
list = LinkedList.new
list.append(7)
list.append(77)
list.append(883)
list.prepend(2)
list.prepend(15)
puts list.to_s
puts ""
puts "Size: #{list.size}"
puts "First link: #{list.head}"
puts "Last link: #{list.tail}"
puts "Link at Index 1: #{list.at(1)}"
puts ""
puts "Popping"
list.pop
puts list.to_s
puts "Contains 7? #{list.contains?(7)}"
puts "Contains 9? #{list.contains?(9)}"
puts "Index of 7? #{list.find(7)}"
puts "Index of 110? #{list.find(110)}"
puts ""
puts "Removing Index 2"
list.remove_at(2)
puts list.to_s
puts "Inserting at Index 2"
list.insert_at("billy", 2)
puts list.to_s
