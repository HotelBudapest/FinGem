
RUBY_FILES = PendingTransactions.rb User.rb Transactions.rb mainInterface.rb

ruboDocs:
	@echo "Making RuboFIN docs using YARD"
	yard doc $(RUBY_FILES)

