# When done, submit this entire file to the autograder.

# Part 1
#Define a method sum(array) that takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.
def sum arr 
  return 0 if arr.empty?#checks to return 0 if empty
  arr.inject(0){|s, e| s+e}#block accumulator to add e's of arr 
end
#puts sum([1,2,5])#test


#Define a method max_2_sum(array) which takes an array of integers as an argument and returns the sum of its two largest elements. 
#For an empty array it should return zero. For an array with just one element, it should return that element.
def max_2_sum arr
  size = arr.length
  case size
    when 0
      return 0
    when 1
      return arr[0]
    else
      return arr.sort!.last(2).inject(0){|s, r| s+r}#sorts arr in Asc. order and saves, takes the last 2, black accumulator on those last 2 e's returned
    end
end
#puts max_2_sum([12, 15, 8, 2, 1, 6])#test


#Define a method sum_to_n?(array) that takes an array of integers and an additional integer, n, as arguments and returns true if any two elements in the array of integers sum to n.
#An empty array should sum to zero by definition.
def sum_to_n? arr, n
  return false if arr.empty?#empty to 0
  i=0
  while i < arr.length do#goes throgh all elements
    e = arr.shift#returns the 1st element to e and removes it from array
    arr.each{ |x| return true if x + e  == n }#add e and all the remaining elements to see if they add up to n
    i += 1
  end
  false
end
#puts sum_to_n?([12], 12)#test


# Part 2
#Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.
def hello name
  # YOUR CODE HERE
  return "Hello, #{name}"
end
#puts hello("Serge")#test


#Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. 
#(For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and lower case and for nonletters!
def starts_with_consonant? s
  return false if s.empty?
  s.downcase!
  if s[0].match(/\A[bcdfghjklmnpqrstvwxyz]/)
    return true
  else
    false
  end
end
#puts starts_with_consonant? "tae taco grande."


#Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number that is a multiple of 4.
#NOTE: be sure it returns false if the string is not a valid binary number!
def binary_multiple_of_4? s
    return false if s == ""#error if i didn't check for ""
    for i in 0..s.size-1 #cycle and check if it's binary
        return false unless s[i] == "0" || s[i] == "1"#1s and 0s only
    end
    s.to_i(2) % 4 == 0
end
#puts binary_multiple_of_4?(110001)


# Part 3
#Define a class BookInStock which represents a book with an ISBN number, isbn, and price of the book as a floating-point number, price, as attributes.
#The constructor should accept the ISBN number (a string, since in real life ISBN numbers can begin with zero and can include hyphens) as the first argument and price as second argument,
#and should raise ArgumentError (one of Ruby's built-in exception types) if the ISBN number is the empty string or if the price is less than or equal to zero. Include the proper getters and setters 
#for these attributes.
#Include a method price_as_string that returns the price of the book formatted with a leading dollar sign and two decimal places, that is, a price of 20 should format as "$20.00" and 
#a price of 33.8 should format as "$33.80".
class BookInStock

  attr_accessor :isbn, :price#create setter getter methods dynamically 
  
  def initialize(isbn, price)
    raise(ArgumentError, "") if isbn.empty?#raise ArgumentError when empty
    raise(ArgumentError, "Price less than or equal to 0") if price <= 0#raise Argument error when p <= 0
    @isbn = isbn
    @price = price
  end
  
  def price_as_string
    return '$' + "%.2f" % @price#correct format to return
  end

end
#a = BookInStock.new("asdf", 15.90)
#puts a.price_as_string