nums = File.read_lines(ARGV[0]).map do |r|
  r.split.map(&.to_i)
end

counts = nums.map(&.last).group_by(&.itself).transform_values(&.size)

puts nums.map(&.first).map {|n| n * counts.fetch(n, 0) }.sum
