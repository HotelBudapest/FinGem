# The PendingTransaction class represents a pending financial transaction.
class PendingTransaction < Transaction
    
    # Checks if the transaction deadline is today and prints a reminder if so.
    #
    # @return [void]
    def deadline
        if @time.split(" ")[0] == Date.today.to_s
        puts "\n!!!--------The Following transaction is to happen today: "
        puts self.str_out
        end 
    end

end
