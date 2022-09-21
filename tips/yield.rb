# Here we have a Box class.
# Boxes print information passed from yielded blocks.
# We can use several methods to pass blocks as arguments.

# box_around_with_yield is called using the yield syntax
# box_around_with_block is called in 3 ways:
# - receiving a block as argument
# - receiving a proc
# - receiving a lambda

class Box
  attr_reader :lines, :title

  def initialize
    @lines = []
    @title = ""
  end

  def border
    "*" * (length_of_longest_line + 4)
  end

  def length_of_longest_line
    @lines.map(&:length).max
  end

  def text(value)
    @lines << value
  end

  def header(value)
    @title = value
  end

  def formatted_line(value)
    "* #{value.ljust(length_of_longest_line, " ")} *"
  end
end

def box_around_with_block(&block)
  if !block_given?
    puts "No block was given"
    return
  end

  box = Box.new
  block.call(box)

  puts box.border
  puts box.title.upcase

  box.lines.each do |line|
    puts box.formatted_line(line)
  end

  puts box.border
end

def box_around_with_yield
  if !block_given?
    puts "No block was given"
    return
  end

  box = Box.new
  yield(box)

  puts box.border
  puts box.title.upcase

  box.lines.each do |line|
    puts box.formatted_line(line)
  end

  puts box.border
end

# All of them work the same way

box_around_with_yield do |box|
  box.header "The Beatles with yield"
  box.text "It was twenty years ago"
  box.text "Seargent Pepper taught the band to play"
end

box_around_with_block do |box|
  box.header "The Beatles with block"
  box.text "It was twenty years ago"
  box.text "Seargent Pepper taught the band to play"
end

proc = Proc.new do |box|
  box.header "The Beatles with proc"
  box.text "It was twenty years ago"
  box.text "Seargent Pepper taught the band to play"
end

lambda1 = ->(box) do
  box.header "The Beatles with lambda 1"
  box.text "It was twenty years ago"
  box.text "Seargent Pepper taught the band to play"
end

lambda2 = lambda do |box|
  box.header "The Beatles with lambda 2"
  box.text "It was twenty years ago"
  box.text "Seargent Pepper taught the band to play"
end

box_around_with_block(&proc)
box_around_with_block(&lambda1)
box_around_with_block(&lambda2)
