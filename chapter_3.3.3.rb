class Silly
  def price=(x)
    puts "The current time is #{Time.now}"
  end
end

class Ticket
  attr_reader :venue
  VENUES = ["Convention Center", "Fairgrounds", "Town Hall"]
  def initialize(venue, date)
    if VENUES.include?(venue)
      @venue = venue
    else
      raise ArgumentError, "Unknown venue #{venue}"
    end  
    @date = date
  end
  def price=(amount)
    if (amount * 100).to_i == amount * 100
      @price = amount
    else
      puts "The price seems to be malformed"
    end
  end

  def price
    @price
  end
end

class TravelAgentSession
  def year=(y)
    @year = y.to_i

    if @year < 100
      @year = @year + 2000
    end
  end
end

class Publication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end

class Ezine < Magazine
end

# mag = Magazine.new
# mag.publisher = "David A. Black"
# mag.editor = "Joe Smith"
# puts "Mag is published by #{mag.publisher}, and edited by #{mag.editor}"

class Person
  def species
    "Homo sapiens"
  end
end

class Rubyist < Person
end

david = Rubyist.new

puts david.species

def Ticket.most_expensive(*tickets)
  tickets.max_by(&:price)
end

th = Ticket.new("Town Hall","11/12/13")
cc = Ticket.new("Convention Center","12/13/14/")
fg = Ticket.new("Fairgrounds", "13/14/15/")
th.price = 12.55
cc.price = 10.00
fg.price = 18.00
highest = Ticket.most_expensive(th,cc,fg)
puts "The highest-priced ticket is the one for #{highest.venue}."


class Temperature
  def Temperature.c2f(celsius)
    celsius * 9.0 / 5 + 32
  end

  def Temperature.f2c(fahrenheit)
    (fahrenheit - 32) * 5 / 9.0
  end
end

puts Temperature.c2f(100)

puts "We've closed the class definition."
puts "So we have to use the path notation to reach the constant."
puts "The venues are:"
puts Ticket::VENUES

venues = Ticket::VENUES
venues << "High School Gym"

puts Ticket::VENUES
puts "--------------"
puts venues