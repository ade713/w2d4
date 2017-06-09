def two_sum(arr, target)
  i = 0
  while i < arr.length
    j = i
    while j < arr.length
      return true if arr[i] + arr[j] == target
      j += 1
    end
    i += 1
  end
  false
end


def okay_two_sum?(arr,target)
  arr.sort!

end
