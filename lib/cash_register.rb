require "pry"

class CashRegister

    attr_reader :discount
    attr_accessor :total, :register

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @register = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times do
            self.register << {title: title, price: price, quantity: quantity  }
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total -= (self.total * self.discount / 100)
            "After the discount, the total comes to $#{self.total}."
        end    
    end

    def items
        @register.map { |item| item[:title] }
    end
    
    def void_last_transaction
        last_transaction = register.pop
        @total -= last_transaction[:price] * last_transaction[:quantity]
      end

    binding.pry
end
