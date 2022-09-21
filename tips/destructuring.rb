# Not destructuring attributes
def old_pair(arr, z)
  puts "old_pair - not destructured"
  puts arr[0]
  puts arr[1]
  puts z
end

# Use extra parentheses to destructure an array
def new_pair((x, y), z)
  puts "new_pair - destructured"
  puts x
  puts y
  puts z
end

old_pair([1, 2], 3)
new_pair([1, 2], 3)

# In this case, the third element will be discarded
new_pair([1, 2, 3], 4)

# We can also destructure an array when using a block!
students = [["Gustavo", 92],
            ["Ana", 96],
            ["Maria", 83],
            ["Max", 88]]

students.each do |(name, grade)|
  puts name + " has got " + grade.to_s
end
