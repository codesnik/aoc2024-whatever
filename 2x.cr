def safe?(report)
  diffs = report.each.cons_pair.map { |(a, b)| a - b }.to_a
  diffs.all? { |d| 1 <= d.abs <= 3 } && (diffs.all?(&.positive?) || diffs.all?(&.negative?))
end

def all_with_one_skipped(report)
  (0..report.size-1).map { |i| report[0...i] + report[i+1..-1] }
end

reports = File.read_lines(ARGV.first).map { |r| r.split.map(&.to_i) }
safe = reports.count { |r| safe?(r) || all_with_one_skipped(r).any? {|r1| safe?(r1) } }

puts safe
