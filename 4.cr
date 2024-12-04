puzzle = File.read_lines(ARGV.first).map(&.chomp)

def transpose(lines)
  (0...lines.first.size).map do |i|
    lines.map {|line| line[i]}.join
  end.to_a
end

def shift_right(lines)
  lines.each_with_index.map do |line, idx|
    (" " * idx) + line + (" " * (lines.size - idx))
  end.to_a
end

def shift_left(lines)
  reverse(shift_right(reverse(lines)))
end

def reverse(lines)
  lines.map(&.reverse)
end

def count(lines)
  lines.sum { |line| line.scan("XMAS").size }
end

def count_both(lines)
  count(lines) + count(reverse(lines))
end

puts(
  count_both(puzzle) +
  count_both(transpose(puzzle)) +
  count_both(transpose(shift_left(puzzle))) +
  count_both(transpose(shift_right(puzzle)))
)
