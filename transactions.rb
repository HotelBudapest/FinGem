class Transaction

    attr_accessor :amount, :type, :time

    def initialize(am, typ, time)
        @amount = am
        @type = typ
        @time = time
    end

end