a, b, c, d = 1, 22.0, "World", 'x'
a #> 1
b #> 22.0
c #> "World"
d #> 'x'
t1 = (1,22.0,"World",'x')
typeof(t1) #> (Int64,Float64,ASCIIString,Char)
t2 = (1, 2, 3)
typeof(t2) #> (Int64,Int64,Int64)
() #> empty tuple
(1,) #> one element tuple
('z', 3.14)::(Char, Float64)

t3 = (5, 6, 7, 8)
t3[1] #> 5
t3[end] #> 8
t3[2:3] #> (6, 7)
# t3[5] #> BoundsError
# t3[3] = 9 #> Error: 'setindex' has no matching ...

author = ("Ivo", "Balbaert", 59)
author[2] #> "Balbaert"

for i in t3
    println(i)
end #> 5  6  7  8

# 튜플 풀기(unpacking):
a, b = t3 #> a는 5이고 b는 6이다
first_name, last_name, age = author
# first_name은 "Ivo"이다
# last_name은 "Balbaert"이다
# age는 59이다
