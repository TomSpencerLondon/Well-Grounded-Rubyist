puts "Backslashes (\\) have to be escaped in double quotes."
puts 'You can just type \ once in a single quoted string.'
puts "But whichever type of quotation mark you use..."
puts "...you have to escape its quotation symbol, such as \"."
puts 'That applies to \' in single-quoted strings too.'
puts 'Backslash-n just looks like \n between single quotes.'
puts "But it means newline\nin a double-quoted string."
puts 'Same with \t, which comes out as \t with single quotes...'
puts "...but inserts a tab character:\tinside double quotes."
puts "You can escape the backslash to get \\n and \\t with double quotes."


puts %q{You needn't escape apostrophes in when using %q }

puts %q-A string-
puts %Q/Another string/
puts %[Yet another string]


eom = <<EOM
This is the first line of text.
This is the second line.
Now we're done.
EOM
puts eom
# => "This is the first line of text.\nThis is the second line.\n ➥ Now we're done.\n"

text = <<-EOM
The EOM doesn't have to be flush left!
EOM

puts text

text = <<-'EOM'
Single-quoted!
Note the literal \n.
And the literal #{2+2}.
EOM

puts text

a = <<EOM.to_i * 10
5
EOM
puts a


array = [1,2,3, <<EOM, 4]
This is the here-doc!
It becomes array[3].
EOM

p array

> s.object_id
=> 768348
>> s.object_id
=> 768348
>> s.object_id
=> 768348