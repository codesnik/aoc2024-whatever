reports = File.read_lines(ARGV.first).map { |r| r.split.map(&.to_i) }
safe = reports.count do |report|
  diffs = report.each_cons(2).map { |(a, b)| a - b }.to_a
  diffs.all? { |d| 1 <= d.abs <= 3} && (diffs.all?(&.positive?) || diffs.all?(&.negative?))
end
puts safe
