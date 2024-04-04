require_relative "transactions"

class User
    
    attr_accessor :name, :balance, :prevTransactions, :pendingTransactions
    
    def initialize(name, balance)
        @name = name
        @balance = balance
        @prevtTansactions = []
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

            elsif amount > @balance
                print "\n\nTransaction amount exceeds current Balance! Do you wish to proceed?(Y/N): "
                proceed = gets.chomp().downcase
                if proceed == "y"
                    @balance -= amount
                    puts "\nTransaction Occured!\nAmount Deducated: -#{amount}\nBalance: #{@balance}"
                end
            end
        else
            puts "Error! Transactions should be of type Number"
        end
    end

end

