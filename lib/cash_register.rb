require 'pry'

class CashRegister
  attr_accessor :total, :discount, :item, :price, :quantity, :last_transaction_value
  
  @@items = []
  
  def initialize(discount = 0)
    @total = 0  #instance of cashregister starts at 0 
    @discount = discount
  end 
  
  # the reader method for total (created by attr_accessor above) satisfies the "returns the current total" test 
  def add_item(item, price, quantity = 1)
    @item = item
    @quantity = quantity 
    @last_transaction_value = price 
    self.total += (price * quantity) #total of instance
  end 
  
  def apply_discount 
    @total = (self.total - (self.total * @discount.to_f/100)).to_i
    if @discount > 0 
      "After the discount, the total comes to $#{@total}."
    else 
      "There is no discount to apply."
    end 
  end 

  def items
    binding.pry
    self.add_item.each do |item, price, quantity|
      @item = self.item 
      @quantity = self.quantity 
    end 
      @@items += [self.item] * quantity 
  end 
  
  def void_last_transaction
    @total = self.total - self.last_transaction_value
  end 
  
end 
