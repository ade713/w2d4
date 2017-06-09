require "byebug"
#Time- O(n! * n )
#Space-  #O(n!)
def first_anagram?(string1, string2)
  string1.chars.permutation(string1.length).to_a.each do |word|
    if word.join("") == string2
      return true
    end
  end
  false
end

#Time - O(n^2)
#Space - O(1)
def second_anagram?(string1, string2)
  until string1.length == 0
    compare = string1[-1]
    string1[-1] = ""
    if string2.include?(compare)
      string2.sub!(compare,"")
    end
  end

  return true if string1.empty? && string2.empty?
  false
end

# Time - O(n log n)
# Space - O(n)
def third_anagram? string1, string2
  string1.chars.sort == string2.chars.sort
end

# Time - O(n)
# Space - O(1)
def fourth_anagram?(string1, string2)
  string1_hash = Hash.new(0)
  string1.chars.each do |letter|
    string1_hash[letter] += 1
  end

  string2_hash = Hash.new(0)
  string2.chars.each do |letter|
    string2_hash[letter] += 1
  end

string1_hash == string2_hash

end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
