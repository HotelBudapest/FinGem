
RUBY_FILES = PendingTransactions.rb User.rb Transactions.rb mainInterface.rb

ruboDocs:
	@echo "Hello"
	yard doc $(RUBY_FILES)

