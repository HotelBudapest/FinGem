require_relative "Transactions"
require_relative "PendingTransactions"

$global_transaction_count = 0

# The User class represents a user with a name, balance, and transaction history.
class User

    attr_accessor :name, :balance, :prevTransactions, :pendingTransactions

    # Initializes a new User instance.
    #
    # @param name [String] the name of the user
    # @param balance [Float] the initial balance of the user
    def initialize(name, balance)
        @name = name
        @balance = balance
        @prevTransactions = []
        @pendingTransactions = []
    end

    # Changes the name of the user.
    #
    # @param n [String] the new name of the user
    # @return [void]
    def changeName(n)
        if n.is_a?(String)
            @name = n
        else 
            puts "Error! Changing name function only accepts String type"
        end
    end

    # Processes a transaction for the user.
    #
    # @param amount [Numeric] the amount of the transaction
    # @param typ [String] the type of transaction ('IN' for income, 'OUT' for expense)
    # @return [void]
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
            puts "\nTransaction Occured!\nAmount Deducted: -#{amount}$\nBalance: #{@balance}"
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
                    puts "\nTransaction Occured!\nAmount Deducted: -#{amount}$\nBalance: #{@balance}"
                    @prevTransactions.push(Transaction.new(amount, type, Time.now.strftime("%Y-%m-%d %H:%M:%S")))
                    updatePrevLs()
                end
            end
        end
        $global_transaction_count += 1;
        else
            puts "Error! Transactions should be of type Number"
        end
    end

    # Returns the number of global transactions begin taken place.
    #
    # @return [int] the number of global transactions
    def self.global_transaction_count
        $global_transaction_count  # Class method to return the current count of global transactions
    end

    # Prints the previous transactions of the user.
    #
    # @return [void]
    def getPrevTransactions
        puts "\nYOUR PREVIOUS #{@prevTransactions.length} TRANSACTIONS: "
        for index in 0..(@prevTransactions.length - 1)
            puts @prevTransactions[index].str_out
        end
    end

    # Updates the list of previous transactions to keep only the most recent 5.
    #
    # @return [void]
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

    # Adds a pending transaction for the user.
    #
    # @return [void]
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

    # Prints the pending transactions of the user.
    #
    # @return [void]
    def getPendingTransactions 
        puts "\nYOUR PENDING TRANSACTIONS: "
        for index in 0..(@pendingTransactions.length - 1)
            puts @pendingTransactions[index].str_out
        end
    end 

    # Prints the status of the user's account, including pending transactions.
    #
    # @return [void]
    def status
        i = 0
        pendingAmount = 0
        while i < @pendingTransactions.length
        if @pendingTransactions[i].get_type == "IN"
            pendingAmount += @pendingTransactions[i].get_amount
        else 
            pendingAmount -= @pendingTransactions[i].get_amount
        end
        @pendingTransactions[i].deadline
        i += 1
        end 
        puts "\n\nUserName: #{@name}\nAccount Balance: #{@balance}$\nPending Transactions: #{@pendingTransactions.length}\nPending Amount: #{pendingAmount}$"
    end 

end
