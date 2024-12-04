puzzle = File.read_lines(ARGV.first).map(&.chomp)

count = 0
(1...puzzle.size-1).each do |y|
  (1...puzzle.first.size-1).each do |x|
    next unless puzzle[y][x] == 'A'

    next unless [puzzle[y-1][x-1], puzzle[y+1][x+1]].sort == ['M', 'S']
    next unless [puzzle[y-1][x+1], puzzle[y+1][x-1]].sort == ['M', 'S']

    count += 1
  end
end

puts count
