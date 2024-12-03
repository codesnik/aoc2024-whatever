puts File.read(ARGV[0]).scan(/mul\((\d+),(\d+)\)/).map { |(_, a, b)| a.to_i * b.to_i }.sum
