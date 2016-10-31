# 예 1:
x = 9
function funscope(n)
  x = 0 # x는 함수의 지역유효범위에 있다
  for i = 1:n
    local x # x는 반복문에서 local이다
    x = i + 1
    if (x == 7)
        println("This is the local x in for: $x") #> 7
    end
  end
  println("This is the local x in funscope: $x") #> 0
  global x = 15
end
funscope(10)
println("This is the global x: $x") #> 15
#=
This is the local x in for: 7
This is the local x in funscope: 0
This is the global x: 15
=#

# 예 2:
x = 9
function funscope(n)
  x = 0
  for i = 1:n
    x = i + 1
    if (x == 7)
        println("This is the local x in funscope: $x") #> 7
    end
  end
  println("This is the local x in funscope: $x") #> 11
  global x = 15
end
funscope(10)
println("This is the global x: $x") #> 15
#=
This is the local x in funscope: 7
This is the local x in funscope: 11
This is the global x: 15
=#

# 예 3:
x = 9
function funscope(n)
  x = 0
  for i = 1:n
    x = i + 1
    if (x == 7)
        println("This is the local x in for: $x") #> 7
    end
  end
  println("This is the local x in funscope: $x") #> 11
end
funscope(10)
println("This is the global x: $x") #> 9
#=
This is the local x in for: 7
This is the local x in funscope: 11
This is the global x: 9
=#

# let 없이:
anon = cell(2)
for i = 1:2
  anon[i] = ()-> println(i)
  i += 1
end
anon[1]() #> 2
anon[2]() #> 3

# let으로:
anon = cell(2)
for i = 1:2
  let i = i
      anon[i] = ()-> println(i)
  end
  i += 1
end
anon[1]() #> 1
anon[2]() #> 2

# begin으로:
begin
    local x = 1
    let
       local x = 2
       println(x) #> 2
    end
    x
    println(x) #> 1
end

# for-반복문과 컴프리헨션:
i = 0
for i = 1:10
end
println(i)  #> 10

i = 0
[i for i = 1:10 ]
println(i)  #> 0
