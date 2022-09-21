# No arguments, default to `nil`
new_hash = Hash.new
new_hash[:not_here]
# => nil

# same behavior with `{}` style
bare_hash = {}
bare_hash[:also_not_here]
# => nil

# == Argument, use as default
hash_with_default = Hash.new(:default)
hash_with_default[:not_set]
# => :default

# The <<= operator is an example of abbreviated assignment - similar to += and ||=.
# It is necessary when we return a default value for a hash but don't set that value in the hash.

# WARNING! This will use the **same** object. Avoid!
h = Hash.new([])
h[:first] <<= 1 # equal to h[:first] = h[:first] << 1
# => {:first => [1]}
h[:second] <<= 2
# => {:first=>[1, 2], :second=>[1, 2]}

# == Using a block (both <<= and << will work the same way in this case)
h = Hash.new { |hash, key| hash[key] = [] }
h[:first] <<= 1
h[:second] <<= 2
# => {:first=>[1], :second=>[2]}

# Let's say you need to create an histogram
# That means you need to count the frequency of occurrences in an array

# This would create new keys in the counter hash if it doesn't exist
# Or increment the counter if the key already exists
counter1 = {}
answers = [1, 2, 2, 2, 2, 5, 3, 3, 0, 1, 4, 4, 4, 4, 4, 4]

answers.each do |answer|
  if counter1.has_key?(answer)
    counter1[answer] += 1
  else
    counter1[answer] = 1
  end
end
puts "counter1"
puts counter1

# We can do it differently by initializing a hash with a block
# Whenever we reference elements to this hash (e.g. counter[:a]),
# we will run the block and create that element inside the hash with value 0.
# The block has two arguments: h = hash / k = key
# Than we can do the same thing as before with less code.
counter2 = Hash.new { |h, k| h[k] = 0 }
# in this simple case, this could also be reached by counter2 = Hash.new(0)
answers.each { |answer| counter2[answer] += 1 }
puts "counter2"
puts counter2

# Now, initializing an array with a block.
# An array of arrays with 2 elements each
indexed_array = Array.new(4) { |i| i }
array_times_2 = Array.new(4) { |n, v| v ? v * 2 : n * 2 }
board = Array.new(2) { Array.new(2) { "cell" } }
p "indexed_array"
p indexed_array
p "array_times_2"
p array_times_2
p "board"
p board

array_times_2.push(5)
p "add 5 to array_times_2"
p array_times_2

array_times_2[3] = 8
p array_times_2
