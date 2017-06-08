require 'byebug'
class Array
  #O(n^2)- Time
  #O(1) - Space
  def my_min
    min = first
    each do |num1|
      each do |num2|
        min = num1 if num1 < num2 && num1 < min
      end
    end
    min
  end
#O(n) Time
#O(1) Space
  def my_min_once
    min = first
    each do |num|
      if num < min
        min = num
      end
    end
    min
  end
#Time O(n^3)
#Space O(n^ 2)
  def largest_continous_subsum
    largest = 0
    subsets = []

    i = 0
    while i < self.length
      j = i
      while j < self.length
        subsets << self[i..j]
        j += 1
      end
      i += 1
    end

    subsets.each do |pair|
      if largest < pair.reduce(:+)
        largest = pair.reduce(:+)
      end
    end
    largest

  end
#Time O(n)
#Space O(1)
  def better_largest_continous_subsum
    largest = first
    current = first
    switch = false
    each_with_index do |num, idx|
      # debugger
      next if idx == 0
      if switch
        current = num
        largest = current if current > largest
        switch = false
      elsif  current + num < current
        if num.abs > current
          switch = true
        else
          current += num
        end
      else
        current += num
      end
      largest = current if current > largest
    end
    largest
  end
end

arr = [5,3,-7]
list = [2, 3, -6, 7, -6, 7]
arr_neg = [-3,-5]


arr.my_min_once
p arr.better_largest_continous_subsum
p list.better_largest_continous_subsum
p arr_neg.better_largest_continous_subsum
