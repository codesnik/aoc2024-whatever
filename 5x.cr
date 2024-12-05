puzzle = File.read(ARGV.first)
pairs_str, pages_str = puzzle.split("\n\n")

sort_pairs = Set(Tuple(Int32, Int32)).new
pairs_str.split.each do |pair_str|
  key, val = pair_str.split("|").map(&.to_i)
  sort_pairs << {key, val}
end

updates = pages_str.split.map {|update| update.split(",").map(&.to_i)}

def middle_page(pages : Array(Int32)) : Int32
  pages[(pages.size / 2).to_i]
end

def sort_pages(sort_pairs, pages)
  pages.sort do |a, b|
    if sort_pairs.includes?({a, b})
      -1
    elsif sort_pairs.includes?({b, a})
      1
    else
      0
    end
  end
end

sum = 0

updates.each do |pages|
  sorted_pages = sort_pages(sort_pairs, pages)
  next if sorted_pages == pages

  sum += middle_page(sort_pages(sort_pairs, pages))
end

puts sum
