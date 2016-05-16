require 'account'
require 'deposit'
require 'withdrawal'
require 'statement'


account = Account.new

account.deposit({date: "10-01-2012", amount: 1000})
account.deposit({date: "13-01-2012", amount: 2000})
account.withdraw({date: "14-01-2012", amount: 500})

statement = Statement.new

statement.print(account)
