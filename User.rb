require_relative "transactions"

class User
    
    attr_accessor :name, :balance, :prevTransactions, :pendingTransactions
    
    def initialize(name, balance)
        @name = name
        @balance = balance
        @prevTransactions = []
        @pendingTransactions = nil
    end

    def changeName(n)
        if n.is_a?(String)
            @name = n
        else 
            puts "Error! Changing name function only accepts String type"
        end
    end

    def transactionOccured(amount, type)
        if amount.is_a?(Numeric) && type.is_a?(String)
            if amount < @balance
                @balance -= amount
                puts "\nTransaction Occured!\nAmount Deducated: -#{amount}\nBalance: #{@balance}"
                @prevTransactions.push(Transaction.new(amount, type))
            elsif amount > @balance
                print "\n\nTransaction amount exceeds current Balance! Do you wish to proceed?(Y/N): "
                proceed = gets.chomp().downcase
                if proceed == "y"
                    @balance -= amount
                    puts "\nTransaction Occured!\nAmount Deducated: -#{amount}\nBalance: #{@balance}"
                    @prevTransactions.push(Transaction.new(amount, type))
                end
            end
        else
            puts "Error! Transactions should be of type Number"
        end
    end

    def getPrevTransactions
        puts "\nYOUR PREVIOUS TRANSACTIONS: "
        for index in 0..(prevTransactions.length - 1)
            puts "\n\nTransaction Type: #{prevTransactions[index].type}\nAmount Deducted: #{prevTransactions[index].amount}\n"
        end
    end

end

