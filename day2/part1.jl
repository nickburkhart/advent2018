input = read(stdin, String)
lines = split(input, "\n")

function char_2_or_3(dict)
  has2 = 0
  has3 = 0
  for c in dict
    if (c[2] == 2)
      has2= 1
    elseif (c[2] == 3)
      has3 = 1
    end
  end
  return (has2, has3)
end

function char_count(line)
  count = Dict()
  for c in line
    if haskey(count, c)
      count[c] = count[c] + 1
    else
      count[c] = 1
    end
  end
  return char_2_or_3(count)
end

function sum(acc, v)
  return (acc[1] + v[1], acc[2] + v[2])
end

has_2_or_3 = map(char_count, lines)
sum_2_or_3 = reduce(sum, has_2_or_3, init=(0, 0))
value = sum_2_or_3[1] * sum_2_or_3[2]
write(stdout, "$value")