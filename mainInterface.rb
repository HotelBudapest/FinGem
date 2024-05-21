require_relative "User"

class MainInterface
  # Initializes the main interface with a user.
  def initialize
    print "Enter your name: "
    name = gets.chomp
    print "Enter initial balance: "
    balance = gets.chomp.to_f

    @person = User.new(name, balance)
  end

  # Displays the main menu for the RuboFIN CLI.
  # @return [void]
  def display_menu
    puts "\n--- RuboFIN CLI ---"
    puts "1. Add a Transaction"
    puts "2. Add a Pending Transaction"
    puts "3. View Previous Transactions"
    puts "4. View Pending Transactions"
    puts "5. View Account Status"
    puts "6. Exit"
    print "Choose an option: "
  end

  # Prompts the user to enter details for a new transaction and adds it to the user's account.
  # @return [void]
  def add_transaction
    print "Enter transaction amount: "
    amount = gets.chomp.to_f
    print "Enter transaction type (IN/OUT): "
    type = gets.chomp.upcase

    @person.transactionOccured(amount, type)
  end

  # Prompts the user to enter details for a new pending transaction and adds it to the user's account.
  # @return [void]
  def add_pending_transaction
    @person.addPendingTransaction
  end

  # Displays the user's previous transactions.
  # @return [void]
  def view_previous_transactions
    @person.getPrevTransactions
  end

  # Displays the user's pending transactions.
  # @return [void]
  def view_pending_transactions
    @person.getPendingTransactions
  end

  # Displays the user's account status, including balance and pending transactions.
  # @return [void]
  def view_account_status
    @person.status
  end

  # Main loop for the RuboFIN CLI, displaying the menu and handling user input.
  # @return [void]
  def run
    loop do
      display_menu
      choice = gets.chomp.to_i

      case choice
      when 1
        add_transaction
      when 2
        add_pending_transaction
      when 3
        view_previous_transactions
      when 4
        view_pending_transactions
      when 5
        view_account_status
      when 6
        puts "Exiting RuboFIN CLI. Goodbye!"
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end
end

# Instantiate and run the MainInterface
main_interface = MainInterface.new
main_interface.run
