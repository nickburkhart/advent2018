input = read(stdin, String)
nums = map(n -> parse(Int, n), split(input, "\n"))

function first_dup(nums, freq=0, check=Set([0]))
  for n in nums
    freq = freq + n
    if in(freq, check)
      return freq
    else
      push!(check, freq)
    end
  end
  return first_dup(nums, freq, check)
end

value = first_dup(nums)
write(stdout, "$value")