# d는 정수형:
@printf("%d\n", 1e5) #> 100000
x = 7.35679
# f = 소수형, 필요하면 반올림한다:
@printf("x = %0.3f\n", x) #> 7.357
aa = 1.5231071779744345
bb = 33.976886930000695
@printf("%.2f %.2f\n", aa, bb) #> 1.52 33.98
# 또는 다른 문자열을 생성한다
str = @sprintf("%0.3f", x)
show(str) #> "7.357"
println()
# e = e와 과학형
@printf("%0.6e\n", x) #> 7.356790e+00
# c는 문자형:
@printf("output: %c\n", 'α') #> output: α
# s는  문자열형:
@printf("%s\n", "I like Julia")
# 오른쪽 정렬:
@printf("%50s\n", "text right justified!")
# p는 포인터형:
@printf("a pointer: %p\n", 1e10) #> a pointer: 0x00000002540be400
