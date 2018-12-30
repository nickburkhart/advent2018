input = read(stdin, String)
lines = split(input, "\n")

function diff_count(line, expected)
  diff = 0
  for combined in zip(collect(line), collect(expected))
    if combined[1] != combined[2]
      diff = diff + 1
    end
    if diff > 1
      return false
    end
  end
  return true
end
function only_common_letters(t) 
  result = collect(chop(t[1]))
  foundMissing = 0
  for i in 1:length(t[1])
    if t[1][i] != t[2][i]
      foundMissing = 1
    else
      result[i - foundMissing] = t[1][i]
    end
  end
  return String(result)
end
function common_letters(lines)
  result = Array{Union{Tuple{String, String}, Nothing}}(nothing, length(lines))
  for i in 1:length(lines) 
    for j in i+1:length(lines)
      if diff_count(lines[i], lines[j])
        result[i] = (lines[i], lines[j])
      end
    end
  end
  return map(only_common_letters, filter(t -> t != nothing, result))
end
common = common_letters(lines)
write(stdout, "$common")