# # Chapter 5 focuses on
# # self and scope
# # self is current or default
# # object
# # scope governs visibility
# # of variables. Important to know
# # what scope you're in so
# # you can tell what the variables
# # refer to and not confuse them with
# # variables from different scopes that
# # have the same name
# # Third point of chapter is
# # method access


# # See what self is by using puts

# # class C
# #   puts "Just started class C:"
# #   puts self
# #   module M
# #     puts "Nested module C::M:"
# #     puts self 
# #   end
# #   puts "Back in the outer level of C:"
# #   puts self
# # end

# # # Let's rig a method to show us
# # # self as it runs
# # class C
# #   def x
# #     puts "Class C, method x:"
# #     puts self
# #   end
# # end

# # c = C.new
# # c.x
# # puts "That was a call to x by; #{c}"
# # # output:
# # #Class C, method x:
# # #<C:0x00007fe60a11d6c0>
# # # That was a call to x by; #<C:0x00007fe60a11d6c0>

# # # >> obj = Object.new
# # => #<Object:0x00007ff0b0965610>
# # >> def obj.show_me
# # >>   puts "Inside singleton method show_me of #{self}"
# # >> end
# # => :show_me
# # >> obj.show_me
# # Inside singleton method show_me of #<Object:0x00007ff0b0965610>
# # # => nil

# # # class C
# # #   def C.x
# # #     puts "Class method of Class C:"
# # #     puts "self: #{self}"
# # #   end
# # # end

# # # C.x
# # # # output
# # # # Class method of Class C:
# # # # self: C
# # # # self.x is same as C.x

# # # class C
# # #   def C.no_dot
# # #     puts "As long as self is C, \
# # # you can call this method with no dot"
# # #   end
# # #   no_dot
# # # end

# # # C.no_dot

# # class C
# #   def x
# #     puts "This is method 'x'"
# #   end
# #   def y
# #     puts "This is method 'y', about to call x without a dot."
# #     x
# #   end
# # end

# # c = C.new
# # c.y

# # Composing whole name from
# # values, using method calls on implicit
# # self

# class Person
#   attr_accessor :first_name, :middle_name, :last_name
#   def whole_name
#     n = first_name + " "
#     n << "#{middle_name} " if middle_name
#     n << last_name
#   end
# end

# # david = Person.new
# # david.first_name = "David"
# # david.last_name = "Black"
# # puts "David's whole name: #{david.whole_name}"
# # david.middle_name = "Alan"
# # puts "David's now whole name #{david.whole_name}"

# # Resolvig instance varaiables
# # through self

# # class C
# #   def show_var
# #     @v = "I am an instance variable initialized \
# # to a string."
# #     puts @v
# #   end
# #   @v = "Instance variables can \
# # appear anywhere..."
# # end
# # C.new.show_var

# class C
#   puts "Just inside class definition block. Here's self:"
#   p self
#   @v = "I am an instance variable at the top level of a class body."
#   puts "And here's the instance variable @v, belonging to #{self}:"
#   p @v
#   def show_var
#     puts "Inside an instance method definition block. Here's self:"
#     p self
#     puts "And here's the instance variable @v, belonging to #{self}:"
#     p @v
#   end
# end
# c = C.new
# c.show_var

# # Scopes include global, local and class variables

# # Global scope and global variables

# $gvar = "I'm a global!"
# class C
#   def examine_global
# #     puts $gvar
# #   end
# # end

# # c = C.new
# # c.examine_global

# # # $: shows directories that Ruby searches when load
# # # external file
# # # $$ shows the PID

# # class Person
# # #   def whole_name
# # #     n = $first_name + " "
# # #     n << "#{$middle_name} " if $middle_name
# # #     n << $last_name
# # #   end
# # # end

# # # # david = Person.new
# # # # $first_name = "David"
# # # # $middle_name = "Alan"
# # # # $last_name = "Black"
# # # # puts david.whole_name

# # # # Local scope

# # # class C
# # #   a = 1
# # #   def local_a
# # #     a = 2
# # #     puts a
# # #   end
# # #   puts a
# # # end

# # # c = C.new
# # # # c.local_a

# # # class C
# # #   a=5
# # #   module M
# # #     a=4
# # #     module N
# # #       a=3
# # #       class D
# # #         a=2
# # #         def show_a
# # #           a=1
# # #           puts a 
# # #         end
# # #         puts a
# # #       end
# # #       puts a
# # #     end
# # #     puts a
# # #   end
# # #   puts a
# # # end

# # # d = C::M::N::D.new
# # # d.show_a

# # module M
# #   class C
# #     class D
# #       module N
# #         X = 1
# #       end
# #     end
# #     puts D::N::X
# #   end
# # end

# class Violin
#   class String
#     attr_accessor :pitch
#     def initialize(pitch)
#       @pitch = pitch
#     end
#   end

#   def initialize
#     @e = String.new("E")
#     @a = String.new("A")
#   end
# end

# def history
#   ::String.new(maker + ", " + date)
# end

# # class Car
# #   @@makes = []
# #   @@cars = {}
# #   @@total_count = 0
# #   attr_reader :make

# #   def self.total_count
# #     @@total_count
# #   end

# #   def self.add_make(make)
# #     unless @@makes.include?(make)
# #       @@makes << make
# #       @@cars[make] = 0
# #     end
# #   end

# #   def initialize(make)
# #     if @@makes.include?(make)
# #       puts "Creating a new #{make}"
# #       @make = make
# #       @@cars[make] += 1
# #       @@total_count += 1
# #     else
# #       raise "No such make: #{make}."
# #     end
# #   end

# #   def make_mates
# #     @@cars[self.make]§
# #   end
# # end

# class Car
#   @@makes = []
#   @@cars = {}
#   attr_reader :make
#   def self.total_count
#     @total_count ||= 0
#   end

#   def self.total_count=(n)
#     @total_count = n
#   end

#   def self.add_make(make)
#     unless @@makes.include?(make)
#       @@makes << make
#       @@cars[make] = 0
#     end
#   end

#   def initialize(make)
#     if @@makes.include?(make)
#       puts "Creating a new #{make}!"
#       @make = make
#       @@cars[make] += 1
#       self.class.total_count += 1
#     else
#       raise "No such make: #{make}."
#     end
#   end

#   def make_mates
#     @@cars[self.make]
#   end
# end

# class Hybrid < Car

# end

# Car.add_make("Honda")
# Car.add_make("Ford")
# h = Car.new("Honda")
# f = Car.new("Ford")
# h2 = Car.new("Honda")

# h3 = Hybrid.new("Honda")
# f2 = Hybrid.new("Ford")
# puts "There are #{Hybrid.total_count} hybrids on the road!"

# class Dog
#   attr_reader :age, :dog_years
#   def dog_years=(years)
#     @dog_years = years
#   end
#   def age=(years)
#     @age = years
#     self.dog_years = years * 7
# end
#   private :dog_years=
# end

# rover = Dog.new
# rover.age = 10
# puts "Rover is #{rover.dog_years} in dog years."

# class C
#   def initialize(n)
#     @n = n
#   end
#   def n
#     @n
#   end
#   def compare(c)
#     if c.n > n
#       puts "The other object's n is bigger."
#     else
#       puts "The other object's n is the same or smaller."
#     end
#   end
#   protected :n
# end

# c1 = C.new(100)
# c2 = C.new(101)
# c1.compare(c2)

