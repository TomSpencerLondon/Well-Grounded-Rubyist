# Classes that use Enumerable enter into a kind of contract: the class has to define an instance method called each, and in return, Enumerable endows the objects of the class with all sorts of collection-related behaviors. The methods behind these behaviors are defined in terms of each. In some respects, you might say the whole concept of a “collection” in Ruby is pegged to the Enumerable module and the methods it defines on top of each.
class C
  include Enumerable

  def each
    # relevant code here
  end
end

# In addition to the Enumerable module, in this chapter we’ll look at a closely related class called Enumerator. Enumerators are objects that encapsulate knowledge of how to iterate through a particular collection. By packaging iteration intelligence in an object that’s separate from the collection itself, enumerators add a further and powerful dimension to Ruby’s already considerable collection-manipulation facilities.

class Rainbow
  include Enumerable
  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"
    yield "indigo"
    yield "violet"
  end
end

r = Rainbow.new
r.each do |color|
  puts "Next color: #{color}"
end

r = Rainbow.new
y_color = r.find {|color| color.start_with?('y') }
puts "First color starting with 'y' is #{y_color}."

# class PlayingCard
#   SUITS = %w{ clubs diamonds hearts spades }
#   RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
#   class Deck
#     def cards
#       @cards.to_enum
#     end
#     def initialize(n=1)
#       @cards = []
#       SUITS.cycle(n) do |s|
#         RANKS.cycle(1) do |r|
#           @cards << "#{r} of #{s}"
#         end
#       end
#     end
#   end
# end

# deck = PlayingCard::Deck.new
# deck.cards << "Joker!!"

class Person
  attr_accessor :age
  def initialize(options)
    self.age = options[:age]
  end
  def teenager?
    (13..19) === age
  end
end

people = 10.step(25,3).map {|i| Person.new(:age => i) }
people.each do |p|
  p p
end

teens =  people.partition {|person| person.teenager? }

teens.each do |t|
  puts "This is the teen"
  p t
end

class Die
  include Enumerable
  def each
    loop do
      yield rand(6) + 1
    end
  end
end

puts "Welcome to 'You Win If You Roll a 6'!"
d = Die.new
d.each do |roll|
  puts "You rolled a #{roll}."
  if roll == 6
    puts "You win!"
  break
  end
end

class PlayingCard
  SUITS = %w{ clubs diamonds hearts spades }
  RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
  class Deck
    attr_reader :cards

    def cards
      @cards.to_enum
    end

    def initialize(n=1)
      @cards = []
      SUITS.cycle(n) do |s|
        RANKS.cycle(1) do |r|
          @cards << "#{r} of #{s}"
        end
      end
    end
  end
end

deck = PlayingCard::Deck.new(2)

p deck