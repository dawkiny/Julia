# 태스팅:
# @assert 1==42 "Shouldn't this be so?"
#> ERROR: assertion failed: Shouldn't this be so?

using Base.Test
# @test 1==3 #> ERROR: test failed: 1 == 3
# @test_approx_eq 1 1.1
#> ERROR: assertion failed: |1 - 1.1| <= 2.220446049250313e-12
@test_approx_eq_eps 1 1.1 0.2

# 디버깅:
arr = [1, 2] #> 2-element Array{Int64,1}: 1 2
@which sort(arr) #> sort(v::AbstractArray{T,1}) at sort.jl:334
456 * 789 + (@show 2 + 3) #>  2 + 3 => 5     359789

# 성능 비교:
@time [x^2 for x in 1:1000] #> elapsed time: 3.911e-6 seconds (8064 bytes allocated) # 1000-element Array{Int64,1}: …
@timed [x^2 for x in 1:1000]
#> ([1,4,9,16,25,36,49,64,81,100  …  982081,984064,986049,988036,990025,992016,9940
# 09,996004,998001,1000000],3.911e-6,8064,0.0)
@elapsed [x^2 for x in 1:1000] #> 3.422e-6
@allocated [x^2 for x in 1:1000] #> 8064
# 시간:
tic() # 시작
[x^2 for x in 1:1000]
toc() # 끝, 시간 출력: elapsed time: 0.024395069 seconds
# toc() # 끝, 시간 반환

# 태스크(task) 시작하기:
a = @async 1 + 2
# Task (done) @0x000000002d70faf0
consume(a) # 3
