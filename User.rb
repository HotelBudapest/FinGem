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
                @prevTransactions.push(Transaction.new(amount, type, Time.now))
                updatePrevLs()
            elsif amount > @balance
                print "\n\nTransaction amount exceeds current Balance! Do you wish to proceed?(Y/N): "
                proceed = gets.chomp().downcase
                if proceed == "y"
                    @balance -= amount
                    puts "\nTransaction Occured!\nAmount Deducated: -#{amount}\nBalance: #{@balance}"
                    @prevTransactions.push(Transaction.new(amount, type, Time.now))
                    updatePrevLs()
                end
            end
        else
            puts "Error! Transactions should be of type Number"
        end
    end

    def getPrevTransactions
        puts "\nYOUR PREVIOUS 5 TRANSACTIONS: "
        for index in 0..(prevTransactions.length - 1)
            puts "\n\nTransaction Type: #{prevTransactions[index].type}\nAmount Deducted: #{prevTransactions[index].amount}\nTime of Transaction: #{prevTransactions[index].time}"
        end
    end

    def updatePrevLs 
        if @prevTransactions.length > 5
            temp = []
            i = 0
            for index in 1...(@prevTransactions.length)
                temp[i] = @prevTransactions[index]
                i += 1
            end
            @prevTransactions = temp.clone
        end
    end

end

