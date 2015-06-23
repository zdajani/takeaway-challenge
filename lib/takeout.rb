require_relative 'order_calculator'

class Takeout
  include OrderCalculator

  attr_reader :menu
  attr_accessor :total, :order

  def initialize 
    @menu = { Pizza: 6, # consider passing in the menu hash, rather than having it hard-coded
              Wings: 4,
              Coke: 2,
              Water: 1 }
    @order = []
    @total = 0
  end

  def show_menu
    menu.map do |item, price| # don't use puts! It couples your object to a particular output: terminal
      "#{item} " + "£#{price}"
    end.join("\n")
  end

  def add_item item, amount = 1 # consider using keyword syntax to improve this method
    fail 'Item not on menu' unless on_menu? item
    add_to_order item, amount
    add_to_total item, amount # consider having the total calculated from the collection of orders, rather than have it be stored and added to within an instance variable
    self.display_order
  end

  def display_order
     "#{order}; Total: £#{total}"
  end

  def pay amount
    fail 'Incorrect payment amount' unless amount == total # consider unless.. == rather than !=
    'Thank you! You will be receiving a text confirmation shortly!'
  end

end
