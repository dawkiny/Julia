# 이름 없는(anonymous) 함수:
(x, y) -> x^3 - y + x * y
f = (x, y) -> x^3 - y + x * y
println(f(3, 2) ) # 31

function (x)
    x + 2
end

(x) -> x + 2
x -> x + 2  # 람다(lambda) 구문
() -> println("hello, Julia")
(x, y, z) -> 3x + 2y - z

