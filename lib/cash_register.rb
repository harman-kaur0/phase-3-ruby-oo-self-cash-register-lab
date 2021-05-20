require "pry"
class CashRegister
    attr_accessor :total, :discount, :items, :prices

    

    def initialize(discount = nil)
        @total = 0
        @discount= discount
        @items = []
        @prices = []   
    end

    def add_item(title, price, quantity= 1)
        @total = @total + (price*quantity)
        @items.concat ([title]*quantity)
        @prices << (price*quantity)
    end

    def apply_discount
        if @discount
            @total = @total*(1 - (@discount/100.0))
            "After the discount, the total comes to $#{@total.round}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @prices[-1]
    end
end