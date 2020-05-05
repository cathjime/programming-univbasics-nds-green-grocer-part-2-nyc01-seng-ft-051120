require_relative './part_1_solution.rb'
require "pry"

def apply_coupons(cart, coupons)
  count = 0 
  
  while count < cart.length do 
    if cart[count][:item] == coupons[count][:item] && cart[count][:count] == coupons[count][:num]
  
      discounted_name = cart[count][:item] + " W/COUPON"
      coupon_price = coupons[count][:cost] / coupons[count][:num]
      new_hash = {:item => discounted_name, :price => coupon_price, :clearance => true, :count =>coupons[count][:num]}
      cart.push(new_hash)
    
    elsif cart[count][:item] == coupons[count][:item] && cart[count][:count] != coupons[count][:num]
    
    binding.pry
      cart[count][:count] = coupons[count][:num] - cart[count][:count] 
      disc_hash = {:item => discounted_name, :price => coupon_price, :clearance => true, :count =>coupons[count][:num]}
      cart.push(disc_hash)
     end
  end 
  
  # REMEMBER: This method **should** update cart
end

#binding.pry

#iterate thru each hash ele in cart 
#find item name in each hash ele 
#if item name matches name inside coupon array 
#update count 
#create new hash w updated item name,price, count
#push new hash into existing arr 
#return updated arr 



def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
