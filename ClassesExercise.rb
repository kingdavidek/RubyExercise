class Person
    attr_accessor :last_name, :first_name
    @@people = Array.new 
    
    def initialize(x,y)
      @last_name=y  
      @first_name=x
      @@people << self 
    end
    
    def self.search(last_name) 
        @a= @@people.select {|n| n =last_name}
    end
    
    def to_s  
      "#{@first_name} #{@last_name}"
    end
end

p1 = Person.new("John", "Smith")
p2 = Person.new("John", "Doe")
p3 = Person.new("Jane", "Smith")
p4 = Person.new("Cool", "Dude")

puts Person.search("Smith")
