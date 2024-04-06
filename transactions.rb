require 'date'

class Transaction

    attr_accessor :amount, :type, :time

    def initialize(am, typ, time)
        @amount = am
        @type = typ.upcase
        @time = time
    end

    def str_out
        if type == "IN"
            return "\n\nTransaction Type: #{@type}\nAmount: +#{@amount}$\nTime of Transaction: #{@time}"
        else
            return "\n\nTransaction Type: #{@type}\nAmount: -#{@amount}$\nTime of Transaction: #{@time}"
        end
    end

end

class PendingTransaction < Transaction
    
    def deadline
        if @time.split(" ")[0] == Date.today.to_s
            puts "!!!--------"
            puts "\nThe Following transaction is to happen today: "
            puts self.str_out
        end 
    end

end 