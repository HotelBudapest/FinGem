require_relative "User"

person = User.new("Arian", 500)

person.transactionOccured(60.12, "in")
person.transactionOccured(21, "OUT")

person.transactionOccured(60.12, "IN")
person.transactionOccured(21, "OUT")
person.transactionOccured(60.12, "IN")
person.transactionOccured(21, "OUT")

person.addPendingTransaction

person.getPrevTransactions

person.getPendingTransactions

person.status