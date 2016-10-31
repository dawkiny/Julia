# 다음은 성능 비교는 벡터를 사용하지 않는 것이 좀 더 성능을 향상함을 보여준다.
x = randn(10000000)
y = randn(10000000)

function inner(x, y)
    result = 0.0
    for i=1:length(x)
        result += x[i] * y[i]
    end
    result
end

# gc_disable()
# tic()
@time for i=1:50 result = sum(x .* y); end
# timing = toc();
# println("Array operations took ", (timing / 50) * 1000, " ms")
# 1개 프로세서: 배열 연산 89.43973046 ms - avg: 90 ms 만큼 소요한다
# 9개 프로세서: elapsed time: 5.358992903 seconds (4000026400 bytes allocated, 34.95% gc time)

@time for i=1:50 result = inner(x, y) end
# elapsed time: 1.126870943 seconds (800 bytes allocated)

x = randn(1, 10000000)
y = randn(10000000, 1)
#tic()
@time for i=1:50 result = x * y end
# elapsed time: 2.401834172 seconds (4800 bytes allocated)
#timing = toc();
#println("BLAS took ", (timing / 50) * 1000, "ms")
