# Bank tech-test

## Specification

### Requirements

* You should be able to interact with the your code via IRB.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see:

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Planning

### User stories

```
As an account holder
So that I can start using my bank account
I would like to see that my balance starts at zero
```

```
As an account holder
So that I can save money
I would like to be able to make a deposit
```

```
As an account holder
So that I can spend money
I would like to be able to make a withdrawal
```

```
As an account holder
So that I can manage my money
I would like to be able to see a printed statement
```

```
As an account holder
So that I can manage my money
I would like transactions on my statement to be dated
```

```
As an account holder
So that I can manage my money
I would like to not be overdrawn
```

## Classes

This program has four classes:
1. Account  
2. Transactions  
3. Transaction  
4. Statement  

Account is the main 'interactive' class, including the methods `deposit`, `withdraw` and `print_statement`.  

## Feature test

The program is designed to be used through IRB as follows:

```
$ irb
2.3.0 :001 > require './lib/account.rb'
 => true
2.3.0 :002 > account = Account.new
 => #<Account:0x007f856b0e2b60 @balance=0, @transactions=#<Transactions:0x007f856b0e2b38 @log=[]>>
2.3.0 :003 > account.deposit(20)
 => [#<Transaction:0x007f856b0dae60 @time=2016-10-18 15:50:55 +0100, @credit=20, @debit=0, @balance=20>]
2.3.0 :004 > account.withdraw(3)
 => [#<Transaction:0x007f856b0dae60 @time=2016-10-18 15:50:55 +0100, @credit=20, @debit=0, @balance=20>, #<Transaction:0x007f856b0d30c0 @time=2016-10-18 15:50:57 +0100, @credit=0, @debit=3, @balance=17>]
2.3.0 :005 > account.print_statement
date || credit || debit || balance
18/10/2016 || 20 || 0 || 20
18/10/2016 || 0 || 3 || 17
```
