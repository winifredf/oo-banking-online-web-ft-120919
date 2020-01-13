class BankAccount
  
  
  def initialize
    
  end
  
  def deposit(money)
    @balance += money
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end
  
  def close_account
    @status = "closed"
  end
end
