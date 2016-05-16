class Statement

  def print(account)
    header_text
    sort_recent(account.transactions).each do |transaction|
      row_text(transaction)
    end
  end

  def header_text
    puts 'date || credit || debit || balance'
  end

  def row_text (transaction)
    printf(transaction.date.strftime("%d/%m/%Y"))
    printf(" || ")
    printf("%#.2f ", transaction.value ) if transaction.value > 0
    printf("|| ")
    printf("%#.2f ", -1 * transaction.value ) if transaction.value < 0
    printf("|| ")
    printf("%#.2f", transaction.balance )
    puts
  end

  private

  def sort_recent(transactions)
    transactions.sort { |x,y| y.date <=> x.date }
  end

end
