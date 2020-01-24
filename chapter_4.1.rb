# module MyFirstModule
#   def say_hello
#     puts "Hello"
#   end
# end

# class ModuleTester
#   include MyFirstModule
# end

# # mt = ModuleTester.new
# # mt.say_hello

# module Stacklike
#   def stack
#     @stack ||= []
#   end

#   def add_to_stack(obj)
#     stack.push(obj)
#   end
  
#   def take_from_stack
#     stack.pop
#   end
# end

# class Stack
#   include Stacklike
# end

# class Stack
#   attr_reader :stack
#   def initialize
#     @stack = []
#   end

#   def add_to_stack(obj)
#     @stack.push(obj)
#   end

#   def take_from_stack
#     @stack.pop
#   end
# end

# # s = Stack.new
# # s.add_to_stack("item one")
# # s.add_to_stack("item two")
# # s.add_to_stack("item three")
# # puts "Objects currently on the stack:"
# # puts s.stack
# # taken = s.take_from_stack
# # puts "Removed this object:"
# # puts taken
# # puts "Now on stack:"
# # puts s.stack

# class Suitcase
# end

# class CargoHold
#   include Stacklike
#   def load_and_report(obj)
#     print "Loading object "
#     puts obj.object_id

#     add_to_stack(obj)
#   end

#   def unload
#     take_from_stack
#   end
# end

# # ch = CargoHold.new
# # sc1 = Suitcase.new
# # sc2 = Suitcase.new
# # sc3 = Suitcase.new
# # ch.load_and_report(sc1)
# # ch.load_and_report(sc2)
# # ch.load_and_report(sc3)
# # first_unloaded = ch.unload
# # print "The first suitcase off the plane is...."
# # puts first_unloaded.object_id

# module M
#   def report
#     puts "'report' method in module M"
#   end
# end

# class C
#   include M
# end

# class D < C
# end

# # obj = D.new
# # obj.report

# module InterestBearing
#   def calculate_interest
#     puts "Placeholder! \
# We're in module InterestBearing."
#   end
# end

# class BankAccount
#   include InterestBearing
#   def calculate_interest
#     puts "Placeholder! \
# We're in class BankAccount."
#     puts "And we're overriding \
# the InterestBearing \
# module."
#   end
# end

# # account = BankAccount.new
# # account.calculate_interest

# module M
#   def report
#     puts "'report' method in module M"
#   end
# end
# module N
#   def report
#     puts "'report' method in module N"
# end end
# class C
#   include M
#   include N
# end

# # c = C.new
# # c.report

# # output:
# # 'report' method in module N

# class C
#   include M
#   include N
#   include M
# end

# # c = C.new
# # c.report

# # reincluding a module does not do anything
# # because M already lies on the search path
# # second include M instruction
# # has no effect
# # N is still considered the most
# # recently included module

# # output 
# # 'report' method in module N
# # 'report' method in module N

# # include affects what happens when
# # instances of class resolve messages
# # into method names
# # same true of prepend
# # prepend module to a class means that
# # the object looks in the module first
# # before it looks in the class

# module MeFirst
#   def report
#     puts "Hello from module!"
#   end
# end
# # class Person
# #   prepend MeFirst
# #   def report
# #     puts "Hello from class!"
# #   end
# # end

# # p = Person.new
# # p.report
# # output:
# # Hello from module!
# # We have prepended the MeFirst module
# # to the class. The instance of the class
# # looks in the module first when
# # trying to find method called report.
# # > Person.ancestors
# # => [MeFirst, Person, Object, Readline, Kernel, BasicObject]
# # change to include

# # class Person
# #   include MeFirst
# #   def report
# #     puts "Hello from class!"
# #   end
# # end

# # p = Person.new
# # p.report
# # output
# # 'report' method in module N
# # Hello from class!
# # => true
# # >> Person.ancestors
# # => [Person, MeFirst, Object, Kernel, BasicObject]

# module M
#   def report
#     puts "'report' method \
# in module M"
#   end
# end

# class C
#   include M

#   def report
#     puts "'report' method in class C"
#     puts "About to trigger the next higher up report method..."
#     super
#     puts "Back from the 'super' call."
#   end
# end

# # c = C.new
# # c.report

# # output:
# # 'report' method in class C
# # About to trigger the next higher up report method...
# # 'report' method in module N
# # Back from the 'super' call.

# class Bicycle
#   attr_reader :gears, :wheels, :seats
#   def initialize(gears = 1)
#     @wheels = 2
#     @seats = 1
#     @gears = gears
#   end
# end

# class Tandem < Bicycle
#   def initialize(gears)
#     super
#     @seats = 2
#   end
# end

# # super handles arguments as follows
# # called with no argument list super forwards
# # arguments to the method from which it's called
# # called with empty argument list - super() - super sends
# # no arguments to the higher up method
# # even if arguments were passed to the current method.
# # called with specific arguments super(a, b, c) super
# # sends exactl those arguments

# # Method missing

# class Student
#   def method_missing(m, *args)
#     if m.to_s.start_with?("grade_for_")
#       puts "HELLO"
#       # return the appropriate grade,
#       # based on parsing the method name
#     else
#       super
#     end
#   end
# end

# # j = Person.new("John")
# # p = Person.new("Paul")
# # g = Person.new("George")
# # r = Person.new("Ringo")
# # j.has_friend(p)
# # j.has_friend(g)

# # g.has_friend(p)
# # r.has_hobby("rings")
# # Person.all_with_friends(p).each do |person|
# #   puts "#{person.name} is friends with #{p.name}"
# # end
# # Person.all_with_hobbies("rings").each do |person|
# #   puts "#{person.name} is into rings"
# # end

# class Person
#   PEOPLE = []
#   attr_reader :name, :hobbies, :friends
#   def initialize(name)
#     @name = name
#     @hobbies = []
#     @friends = []
#     PEOPLE << self
#   end

#   def has_hobby(hobby)
#     @hobbies << hobby
#   end

#   def has_friend(friend)
#     @friends << friend
#   end

#   def self.method_missing(m, *args)
#     method = m.to_s
#     if method.start_with?("all_with_")
#       attr = method[9..-1]
#       if self.public_method_defined?(attr)
#         PEOPLE.find_all do |person|
#           person.send(attr).include?(args[0])
#         end
#       else
#         raise ArgumentError, "Can't find #{attr}"
#       end
#     else
#       super
#     end
#   end
# end

# # Inherit or mix in

# # CargoHold here inherits from Stack instead of mixing
# # in Stacklike

# class Stack
#   attr_reader :stack
#   def initialize
#     @stack = []
#   end
#   def add_to_stack(obj)
#     @stack.push(obj)
#   end
#   def take_from_stack
#     @stack.pop
#   end
# end
# class Suitcase
# end
# class CargoHold < Stack
#   def load_and_report(obj)
#     print "Loading object "
#     puts obj.object_id
#     add_to_stack(obj)
#   end
#   def unload
#     take_from_stack
#   end
# end

# # Disadvantage: eats up inheritance based
# # opportunity CorgoHold has.

# # modules dont have instances
# # therefore entities or things in classes
# # characteristics or properties of entities
# # are best encapsulated in modules.

# # class can have only one superclass
# # but it can mix in as many modules as it likes
# # Dont do this... 
# # module Vehicle
# # ...
# # class SelfPropelling
# # ...
# # class Truck < SelfPropelling
# #   include Vehicle
# # ...

# #Rather do this...

# # module SelfPropelling
# # ...
# # class Vehicle
# #   include SelfPropelling
# # ...
# # class Truck < Vehicle
# # ...

# # Can also nest classes inside modules:

module Tools
  class Hammer
  end
end

h = Tools::Hammer.new

# It’s particularly important to take on board the way that objects resolve messages into methods: they go on a search through a succession of classes and modules. Objects
# CHAPTER 4 Modules and program organization
# don’t themselves have methods, even though phrasing it that way is sometimes a handy shortcut. Classes and modules have methods; objects have the ability to traverse classes and modules in search of methods.