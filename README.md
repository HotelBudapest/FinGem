# RuboFIN

![RuboFIN Logo](RuboFIN Logo.webp)

RuboFIN is a Ruby-based financial management system that allows users to manage their transactions and keep track of their account balance. It includes classes for handling users, transactions, and pending transactions. This project provides an interactive command-line interface (CLI) for managing and viewing transactions.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [How to Operate RuboFIN](#how-to-operate-rubofin)
- [Features](#features)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)
- [Contact Information](#contact-information)
- [Acknowledgments](#acknowledgments)

## Installation

To get started with RuboFIN, clone the repository and install the necessary dependencies.


### Clone the repository

```sh
git clone https://github.com/your-username/RuboFIN.git
```

### Navigate to the project directory

```sh
cd RuboFIN
```

### Install any dependencies (if necessary)

For example, if you use Bundler:
```sh
bundle install
```

## Usage

Run the main interface script to interact with RuboFIN.

```sh
# Run the main interface
ruby mainInterface.rb
```

## How to Operate RuboFIN

Once you run `ruby mainInterface.rb`, you will be prompted to enter your name and initial balance. After that, you will see an interactive menu with the following options:

1. **Add a Transaction**: Enter the transaction amount and type (`IN` for income, `OUT` for expense).
2. **Add a Pending Transaction**: Enter the details for a new pending transaction.
3. **View Previous Transactions**: Display all previous transactions.
4. **View Pending Transactions**: Display all pending transactions.
5. **View Account Status**: View the current account balance and details of pending transactions.
6. **Exit**: Exit the CLI.

Follow the on-screen prompts to navigate through the menu and manage your transactions.

### Example Session

```plaintext
Enter your name: Arian
Enter initial balance: 500

--- RuboFIN CLI ---
1. Add a Transaction
2. Add a Pending Transaction
3. View Previous Transactions
4. View Pending Transactions
5. View Account Status
6. Exit
Choose an option: 1
Enter transaction amount: 60.12
Enter transaction type (IN/OUT): IN

--- RuboFIN CLI ---
1. Add a Transaction
2. Add a Pending Transaction
3. View Previous Transactions
4. View Pending Transactions
5. View Account Status
6. Exit
Choose an option: 5

UserName: Arian
Account Balance: 560.12$
Pending Transactions: 0
Pending Amount: 0.0$

--- RuboFIN CLI ---
1. Add a Transaction
2. Add a Pending Transaction
3. View Previous Transactions
4. View Pending Transactions
5. View Account Status
6. Exit
Choose an option: 6
Exiting RuboFIN CLI. Goodbye!
```

## Features

- **User Management**: Create and manage user accounts.
- **Transaction Handling**: Process incoming and outgoing transactions.
- **Pending Transactions**: Manage and remind users of pending transactions.
- **Global Transaction Count**: Track the total number of transactions globally.

## Documentation

Detailed documentation is generated using YARD. To generate the documentation, run:

```sh
yard doc mainInterface.rb User.rb Transactions.rb PendingTransactions.rb
```

You can view the generated documentation in the `doc` directory.

- **Email**: arianislam.010@gmail.com
