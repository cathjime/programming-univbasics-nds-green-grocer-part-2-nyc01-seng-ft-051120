require_relative './part_1_solution.rb'
require "pry"

def apply_coupons(cart, coupons)
  count = 0 
  
  while count < coupons.length do 
    cart_item = find_item_by_name_in_collection(coupons[count][:item], cart)
    coupon_item = "#{coupons[count][:item]} W/COUPON"
    existing_coupon_item = find_item_by_name_in_collection(coupon_item, cart)
    if cart_item && cart_item[:count] >= coupons[count][:num]
      if existing_coupon_item
        existing_coupon_item[:count] += coupons[count][:num]
        cart_item[:count] -= coupons[count][:num]
      else 
        existing_coupon_item = {
          :item => coupon_item, 
          :price => coupons[count][:cost] / coupons[count][:num], 
          :clearance => cart_item[:clearance], 
          :count => coupons[count][:num]
        }
        cart << existing_coupon_item
        cart_item[:count] -= coupons[count][:num]
      end 
    end
      count += 1 
  end 
  cart 
end
    

def apply_clearance(cart)
  counter = 0 
  
  while counter < cart.length do 
    if cart[counter][:clearance] == true 
      applied_discount = cart[counter][:price] - (cart[counter][:price] * 0.20)
       cart[counter][:price] = applied_discount.round(2)
    end 
      counter += 1 
  end 
  cart
end



def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(couponed_cart)
  
  total = 0 
  counter = 0 
  while counter < final_cart.length do 
    total += final_cart[counter][:price] * final_cart[counter][:count]
    counter += 1 
  end 
  
  
  
end
 # binding.pry

