require_relative "User"

person = User.new("Arian", 500)
puts person.balance
puts person.name
person.changeName("saad")
puts person.name

person.transactionOccured(60.12, "xys")
person.balance

person.transactionOccured(600.123, "sad")