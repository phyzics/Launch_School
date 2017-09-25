# med_03.rb
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

=begin
- the only problem is if we don't want to write :product_name after the object
  is instantiated. This can be solved by keepeing it as attr_reader and using
  attr_accessor

  ^True, but incorrect. See LS answer
=end
