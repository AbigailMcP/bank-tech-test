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
