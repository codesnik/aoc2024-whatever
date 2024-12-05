puzzle = File.read(ARGV.first)
pairs_str, pages_str = puzzle.split("\n\n")

pairs = Hash(Int32, Array(Int32)).new
pairs_str.split.each do |pair_str|
  key, val = pair_str.split("|").map(&.to_i)
  pairs[key] ||= Array(Int32).new
  pairs[key] << val
end

updates = pages_str.split.map {|update| update.split(",").map(&.to_i)}

def ordered?(pairs : Hash(Int32, Array(Int32)), pages : Array(Int32)) : Bool
  printed = Set(Int32).new
  pages.each do |page|
    printed << page
    next unless pairs[page]?
    pairs[page].each do |other_page|
      if printed.includes?(other_page)
        return false
      end
    end
  end
  true
end

def middle_page(pages : Array(Int32)) : Int32
  pages[(pages.size / 2).to_i]
end

sum = 0
updates.each do |pages|
  if ordered?(pairs, pages)
    sum += middle_page(pages)
  end
end

puts sum
