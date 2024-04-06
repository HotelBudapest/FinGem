require_relative "transactions"

class User
    
    attr_accessor :name, :balance, :prevTransactions, :pendingTransactions
    
    def initialize(name, balance)
        @name = name
        @balance = balance
        @prevTransactions = []
        @pendingTransactions = []
    end

    def changeName(n)
        if n.is_a?(String)
            @name = n
        else 
            puts "Error! Changing name function only accepts String type"
        end
    end

    def transactionOccured(amount, typ)
        type = typ.upcase
        if amount.is_a?(Numeric) && type.is_a?(String)

            if type == "IN"
                @balance += amount
                puts "\nTransaction Occured!\nAmount Added: +#{amount}$\nBalance: #{@balance}"

                @prevTransactions.push(Transaction.new(amount, type, Time.now.strftime("%Y-%m-%d %H:%M:%S")))
                updatePrevLs()

            elsif type == "OUT"
                if amount < @balance
                    @balance -= amount
                    puts "\nTransaction Occured!\nAmount Deducated: -#{amount}$\nBalance: #{@balance}"
                    @prevTransactions.push(Transaction.new(amount, type, Time.now.strftime("%Y-%m-%d %H:%M:%S")))
                    updatePrevLs()

                elsif amount > @balance
                    while true
                        print "\n\nTransaction amount exceeds current Balance! Do you wish to proceed?(Y/N): "
                        proceed = false
                        input = gets.chomp().downcase
                        if input == "y" || input == "n"
                            proceed = true
                            break
                        else
                            puts "\nInvalid type"
                        end 
                    end
                    if proceed && input == "y"
                        @balance -= amount
                        puts "\nTransaction Occured!\nAmount Deducated: -#{amount}$\nBalance: #{@balance}"
                        @prevTransactions.push(Transaction.new(amount, type, Time.now.strftime("%Y-%m-%d %H:%M:%S")))
                        updatePrevLs()
                    end
                end
            end
        else
            puts "Error! Transactions should be of type Number"
        end
    end

    def getPrevTransactions
        puts "\nYOUR PREVIOUS #{@prevTransactions.length} TRANSACTIONS: "
        for index in 0..(@prevTransactions.length - 1)
            puts @prevTransactions[index].str_out
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

    def addPendingTransaction
        puts "\n\n- Initializing Pending Transaction -"
        while true
            print "Enter amount: "
            amount_input = gets.chomp()
            if !(amount_input.match?(/\A-?\d+(\.\d+)?\z/))
                puts "\nInvalid Entry! Amount must be a Number. Try Again"
            else
                break
            end
        end
        amount = amount_input.to_f
        print "Enter type: "
        type = gets.chomp()
        print "Enter time (Y-M-D H:M:S): "
        time = gets.chomp()
        @pendingTransactions.push(PendingTransaction.new(amount, type, time))
    end

    def getPendingTransactions 
        puts "\nYOUR PENDING TRANSACTIONS: "
        for index in 0..(@pendingTransactions.length - 1)
            puts @pendingTransactions[index].str_out
        end
    end 

    def status
        i = 0
        pendingAmount = 0
        while i < @pendingTransactions.length
            if @pendingTransactions[i].type == "IN"
                pendingAmount += @pendingTransactions[i].getAmount
            else 
                pendingAmount -= @pendingTransactions[i].getAmount
            end
            @pendingTransactions[i].deadline
            i += 1
        end 
        puts "\n\nUserName: #{@name}\nAccount Balance: #{@balance}$\nPending Transactions: #{@pendingTransactions.length}\nPending Amount: #{pendingAmount}$"
    end 

end

