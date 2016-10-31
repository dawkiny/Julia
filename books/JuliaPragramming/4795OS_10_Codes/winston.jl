# Winston:
Pkg.add("Winston")
using Winston
# 그리기 전에 크기조절를 조절할 수 있다
figure(width=600, height=400)
# 데이터 그리기
pl = plot(cumsum(rand(500) - 0.5), "r", cumsum(rand(500) - 0.5), "b")
# 그리기
display(pl)
println("Press enter to continue: ")
readline(STDIN)
# 현재 그림 저장
savefig("winston.svg")
