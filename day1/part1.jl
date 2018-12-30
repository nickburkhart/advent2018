input = read(stdin, String)
nums = map(n -> parse(Int, n), split(input, "\n"))
value = reduce(+, nums, init=0)
write(stdout, "$value")