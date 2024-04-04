require_relative "User"

person = User.new("Arian", 500)

person.transactionOccured(60.12, "xys")
person.balance

person.transactionOccured(600.123, "sad")

person.getPrevTransactions