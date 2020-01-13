class Transfer
  # your code here
  attr_accessor :status, :bankaccount
  attr_reader :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
              @sender = sender
              @receiver = receiver
              @status = "pending"
              @amount = amount
            end

            def valid?
              sender.valid? && receiver.valid?
            end

            def execute_transaction
              if sender.balance < amount
                @status = "rejected"
                return "Transaction rejected. Please check your account balance."
              elsif @status != "complete" && sender.valid?
                @receiver.balance = @receiver.balance + amount
                @sender.balance = @sender.balance - amount
                @status = "complete"
              end
            end

            def reverse_transfer
              if self.execute_transaction && valid? && @receiver.balance > amount && status == "complete"
                #binding.pry
                @receiver.balance = @receiver.balance - amount
                @sender.balance = @sender.balance + amount
                @status = "reversed"
              end
            end

          end