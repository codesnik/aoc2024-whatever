enabled = true

muls = File.read(ARGV[0]).scan(/do\(\)|don't\(\)|mul\(\d+,\d+\)/).select do |str|
  case str.to_s
  when "do()"
    enabled = true
    false
  when "don't()"
    enabled = false
    false
  else
    enabled
  end
end.map(&.to_s)

result = 0
muls.each do |str|
  if str.match(/mul\((\d+),(\d+)\)/)
    result += $1.to_i * $2.to_i
  end
end

puts result
