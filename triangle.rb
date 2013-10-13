# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  fail TriangleError.new("Sides must be > 0") unless all_greater_zero?(a, b, c)
  fail TriangleError.new("Sides must satisfy triangle inequality") unless triangle_inequality?(a, b, c)
  
  result = if equilateral?(a, b, c)
             :equilateral
           elsif isosceles?(a, b, c)
             :isosceles
           else
             :scalene 
           end
end

def equilateral?(a, b, c)
  (a == b) && (b == c)
end

def isosceles?(a, b, c)
  (a == b) || (b == c) || (a == c)
end

def all_greater_zero?(*args)
  result = !args.empty?
  args.each { |arg| result &= arg > 0 }
  result
end

def triangle_inequality?(a, b, c)
  (a + b > c) && (b + c > a) && (a + c > b) 
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
