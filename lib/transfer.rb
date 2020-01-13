class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
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
      if sender.balance < amount
        @status = "rejected"
          return "Transaction rejected. Please check your account balance."
      else @status != "complete" && sender.valid?
        @receiver.balance = @receiver.balance + amount
        @sender.balance = @sender.balance - amount
        @status = "complete"
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


