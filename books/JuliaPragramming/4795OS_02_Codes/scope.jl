# 타입 어노테이션(type annotation)과 유효범위(scope):
x = 1.0 # x는 Float64
x = 1 # x는  Int
# y::Float64 = 1.0 # LoadError: "y is not defined"

function scopetest()
	println(x)
    y::Float64 = 1.0 # y는 Float64이어야 하며, 전역 유효범위가 아니다.
    # y = 1
end

scopetest() #> 1
# println(y) #> ERROR: y not defined

# 복합 표현식(compound expressions):
x = begin
  a = 5
  2 * a
end # after: x is 10
println(a) #> a는 5이다
x = (a = 5; 2 * a)
