nums = File.read_lines(ARGV[0]).map do |r|
  r.split.map(&.to_i)
end

f1 = nums.map(&.first).sort
f2 = nums.map(&.last).sort

puts f1.zip(f2).map {|n1, n2| (n1-n2).abs }.sum
