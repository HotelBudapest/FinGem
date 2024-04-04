require_relative "User"

person = User.new("Arian", 500)

person.transactionOccured(60.12, "xys")
person.balance

person.transactionOccured(23, "sad")
person.transactionOccured(12, "sad")
person.transactionOccured(2, "sad")
person.transactionOccured(13, "sad")
person.transactionOccured(41, "sad")
person.transactionOccured(9, "sad")
person.transactionOccured(80, "sad")

person.transactionOccured(800, "sad")

person.getPrevTransactions