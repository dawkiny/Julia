# n = mult(3, 4) #> ErrorException("mult not defined"))
function mult(x, y)
    println("x is $x and y is $y")
    x * y
end

n = mult(3, 4) #> 12

function mult(x, y)
    println("x is $x and y is $y")
    if x == 1
        return y
    end
    x * y
end

function multi(n, m)
    n * m, div(n, m), n % m
end
x, y, z = multi(8, 2)  #> (16,4,0)

# 아규먼트 개수:
function varargs(n, m, args...)
    println("arguments: $n $m $args")
end
varargs(1, 2, 3, 4) # n은 1, m은 2, 나머지는 (3, 4)

function varargs2(args...)
    println("arguments2: $args")
end

x = (3, 4)
varargs2(1, 2, x...) # args는 (1,2,3,4)
x = [10, 11, 12]
varargs2(1, 2, x...) # args는 (1,2,10,11,12)

function insert_elem(arr)
    push!(arr, -10)
end

arr = [ 2, 3, 4]
insert_elem(arr)
println("arr is now $arr") #> arr is now [ 2, 3, 4, -10 ]

# 아규먼트 타입:
function mult(x::Float64, y::Float64)
    println("x is $x and y is $y")
    x * y
end
# 다음과 같은 오류가 발생한다:
# mult(5, 6)
# ERROR: `mult` has no method matching mult(::Int64, ::Int64)

# 한줄 대입 구문(one-line assignment syntax):
mult(x, y) = x * y
f(x, y) = x^3 - y + x*y
println(f(3,2) ) # 31

∑(x,y) = x + y
∑(3, 4) #> 7
