Explain this snippet using the correct terminology
What will it output?
```
a = 4
b = 2

[a, b].each do
  c = 3
  a = c
end

puts a
puts b
```

Explain this snippet using the correct terminology
What will it output?
What concept is demonstrated?
```
x = "Bob"

3.times do |x|
  x = "Alice"
  puts x
end

puts x
```

Explain this snippet using the correct terminology
What will it output?
What concept is demonstrated?
```
def fix(value)
  value.upcase!
  value.concat('!')
end

s = 'hello'
fix(s)
puts s
```


Explain why this method prints what it prints (how it currently works)
Fix the method so that it actually prints the input string in uppercase
- don't just call `.upcase` on input
```
def upcase(input)
  puts input.chars.each { |c| c.upcase! }
end

upcase('you')
```
