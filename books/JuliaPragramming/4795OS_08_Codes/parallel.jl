# 다음 명령으로 시작한다.
# julia -p n  # local machine에서 n개 프로세스 시작한다
# julia -p 8  # 8개 워커(worker)로 REPL을 시작한다
workers()
# 8-element Array{Int64,1}:
#   2
#   3
#   4
#   5
#   ⋮
#   8
#   9

# 워커에 대한 반복:
for pid in workers()
	# pid로 실행
end
myid() # 1
addprocs(5)
# 5-element Array{Any,1}:
#  10
#  11
#  12
#  13
#  14
nprocs() # 14
rmprocs(3) # id 3인 워커 삭제

# 컴퓨터 클러스터:
# julia --machinefile machines driver.jl
# 머신에 있는 호스트에 대한 driver.jl에 있는 프로세스 실행

# 프로세스로 기본 연산:
r1 = remotecall(2, x -> x^2, 1000) #> RemoteRef(2,1,20)
fetch(r1) #> 1000000

remotecall_fetch(5, sin, 2pi) # -2.4492935982947064e-16

r2 = @spawnat 4 sqrt(2) # 워커 4에게 sqrt(2)을 계산한다
fetch(r2)  #> 1.4142135623730951
r = [@spawnat w sqrt(5) for w in workers()]
# 또는 새로 시작한 REPL:
# r = [@spawnat i sqrt(5) for i=1:length(workers())]
# 6-element Array{Any,1}:
#  RemoteRef(1,1,8)
#  RemoteRef(2,1,9)
#  RemoteRef(3,1,10)
#  RemoteRef(4,1,11)
#  RemoteRef(5,1,12)
#  RemoteRef(6,1,13)
r3 = @spawn sqrt(5) #> RemoteRef(5,1,26)
fetch(r3) #> 2.23606797749979

# 모든 함수에 사용할 수 있는 함수를 만들기 위해 @everywhere 사용:
@everywhere w = 8
@everywhere println(myid()) # 1
        # From worker 2:  2
        # From worker 3:  3
        # From worker 4:  4
        # From worker 7:  7
        # From worker 5:  5
        # From worker 6:  6
        # From worker 8:  8
        # From worker 9:  9

@everywhere include("defs.jl")
@everywhere function fib(n)
	if (n < 2) then
	return n
	else return fib(n-1) + fib(n-2)
	end
end
require("functions")

# 모든 워커에 데이터 브로드케스트:
d = "Julia"
for pid in workers()
   remotecall(pid, x -> (global d; d = x; nothing), d)
end
#= Output:
1   From worker 2:  2

    From worker 4:  4
    From worker 5:  5
    From worker 6:  6
=#
