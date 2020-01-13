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
    if self.sender.valid? && self.sender.balance > self.amount && self.status != "complete"
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
      
    else
      self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      sender.deposit(self.amount)
      receiver.withdrawal(self.amount)
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."      
    end
  end
end