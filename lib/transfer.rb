class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :bankaccount
  
  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end 

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else 
      false
    end
  end
  
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
       @sender.balance -= @amount
       @receiver.balance += @amount
       @status = "complete"
    
    else @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    
    
  end
  
  
  
  def reverse_transfer
   if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end 
end


