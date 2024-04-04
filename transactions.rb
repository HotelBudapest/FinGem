class Transaction

    attr_accessor :amount, :type, :time

    def initialize(am, typ, time)
        @amount = am
        @type = typ.upcase
        @time = time
    end

end

class PendingTransaction < Transaction
    
end 