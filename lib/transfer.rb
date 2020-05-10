class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    return sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    return "Transaction rejected. Please check your account balance." if !@sender.valid? || @sender.balance < @amount
    return nil if @status == "complete"
    
    sender.deposit(-@amount)
    receiver.deposit(@amount)
    @status = "complete"
    
  end
end
