# In programming, you generally deal 
# not only with individual objects 
# but with collec- tions of objects. 
# You search through collections to find 
# an object that matches cer- tain criteria (like a magazine object containing a particular article); 
# you sort collections for further processing or visual presentation; 
# you filter collections to include or exclude particular items; and so forth. All of these operations, 
# and simi- lar ones, depend on objects being accessible in collections.

array = ["ruby", "diamond", "emerald"]
hash = { 0 => "ruby", 1 => "diamond", 2 => "emerald" }
puts array[0]    # ruby
puts hash[0]     # ruby

hash = { "red" => "ruby", "white" => "diamond", "green" => "emerald" }
hash.each.with_index {|(key,value),i|
  puts "Pair #{i} is: #{key}/#{value}"
}


state_hash = { "Connecticut" => "CT",
  "Delaware"    => "DE",
  "New Jersey"  => "NJ",
  "Virginia"    => "VA" }
print "Enter the name of a state: "
state = gets.chomp
abbr = state_hash[state]
puts "The abbreviation is #{abbr}."

def m(a:, b:)
  p a, b
end

m(a: 1, b: 2)
