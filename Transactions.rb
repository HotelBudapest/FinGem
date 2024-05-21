require 'date'

# The Transaction class represents a transaction.
class Transaction

    # @!attribute [rw] amount
    #   @return [Numeric] the transacted amount
    # @!attribute [rw] type
    #   @return [String] the type of transaction (IN/OUT)
    # @!attribute [rw] time
    #   @return [String] time of the transaction taking place
    protected
    attr_accessor :amount, :type, :time

    public
    # Initializes a new Transaction instance.
    #
    # @param am [Numeric] the amount of the transaction
    # @param typ [String] the type of the transaction ('IN' or 'OUT')
    # @param time [String] the time of the transaction
    def initialize(am, typ, time)
        @amount = am
        @type = typ.upcase
        @time = time
    end

    # Returns a string representation of the transaction.
    #
    # @return [String] the transaction details as a string
    def str_out
        if get_type == "IN"
          return "\n\nTransaction Type: #{get_type}\nAmount: +#{get_amount}$\nTime of Transaction: #{get_time}"
        else
          return "\n\nTransaction Type: #{get_type}\nAmount: -#{get_amount}$\nTime of Transaction: #{get_time}"
        end
      end
    
    # Returns the transaction amount attribute/state.
    #
    # @return [Numeric] the transaction details as a string
    def get_amount
        @amount
    end

    # Returns the transaction type attribute/state.
    #
    # @return [String] the transaction details as a string
    def get_type
        @type
    end

    # Returns the time of transaction attribute/state.
    #
    # @return [String] the transaction details as a string
    def get_time
        @time
    end   
end
