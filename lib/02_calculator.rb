puts "add 0 + 0"
puts 0 + 0
puts "add 2 + 2"
puts 2 + 2
puts "adds positive numbers"
def add(a, b)
    return (a + b)
end
puts add(2, 6)

puts "subtract"
def subtract(a, b)
    return (a - b)
end
puts subtract(10, 4)

puts "computes the sum of an empty array"
def sum(array)
    total = 0
    array.each do |number|
        total += number
end
return total
end
array = [] 
result = sum(array)  
puts "le resultat est #{result}"

    
puts "computes the sum of an array of one number"
def sum(array)
    total = 0
    array.each do |number|
        total += number
end
return total
end
array = [7] 
result = sum(array) 
puts "le resultat est #{result}"

"computes the sum of an array of two numbers"
def sum(array)
    total = 0
    array.each do |number|
        total += number
end
return total
end
array = [7, 11] 
result = sum(array) 
puts "le resultat est #{result}"

"computes the sum of an array of many numbers"
def sum(array)
    total = 0
    array.each do |number|
        total += number
end
return total
end
array = [1,3,5,7,9] 
result = sum(array) 
puts "le resultat est #{result}"

puts "multiplies two numbers"
def multiply(a, b)
    return a * b
  end
  puts (3 * 4)

  puts "multiplies two numbers"
def multiply(a, b)
    return a * b
  end
  puts (10 * 3)

  puts "multiplies two numbers"
def multiply(a, b)
    return a * b
  end
  puts (0 * 9)

  def factorial(n)
    return 1 if n == 0
    (1..n).reduce(1, :*)
  end