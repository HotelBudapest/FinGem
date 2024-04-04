class Transaction

    attr_accessor :amount, :type

    def initialize(am, typ)
        @amount = am
        @type = typ
    end

end