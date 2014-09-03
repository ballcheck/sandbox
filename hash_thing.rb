mystring = "aabcdffaaaaabbddddde"
res = mystring.scan( /((.)\2*)/ )
matches = res.map( &:first )
sorted = matches.sort { |a, b| a.length <=> b.length }

cnt = {}
sorted.each do |val|
  cnt[val.length] = []
end

sorted.each do |val|
  cnt[val.length].push( val )
end

biggest_key = cnt.keys.last
puts cnt[biggest_key]

