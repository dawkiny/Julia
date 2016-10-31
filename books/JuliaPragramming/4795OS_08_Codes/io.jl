# 이 스크립트 전체를 실행하지 말자.
# 줄리아 프롬프트에서 실행:
# julia> STDIN
# TTY(open, 0 bytes waiting)
# julia> STDOUT
# TTY(open, 0 bytes waiting)

# read(STDIN, Char)
write(STDOUT, "Julia") #> Julia5
# readbytes(STDIN,3)
# readline(STDIN)
# input:  # Julia
# output: # "Julia\r\n" (Windows) - "Julia\n" (Linux)

# stream은 STDIN이나 입력 스트림이 될 수 있다:
stream = STDIN
for line in eachline(stream)
    print("Found $line")
end

while !eof(stream)
    x = read(stream, Char)
    println("Found: $x")
end


function process(item)
    # 처리
end

# 파일:
names(IOStream)
# 4-element Array{Symbol,1}:
#  :handle
#  :ios
#  :name
#  :mark

IOStream.types
# (Ptr{None},Array{Uint8,1},String,Int64)

# 읽기:
fname = "example.dat"
f1 = open(fname)
# IOStream(<file example.dat>)

data = readlines(f1)
# 3-element Array{Union(ASCIIString,UTF8String),1}:
#  "this is line 1.\r\n"
#  "this is line 2.\r\n"
#  "this is line 3."

for line in data
	println(line)
	process(line)
end
close(f1)

open(fname) do file
    process(file)
end

open(fname) do file
    for line in eachline(file)
        print(line)
        process(line)
    end
end

# 쓰기:
fname = "example2.dat"
f2 = open(fname, "w")
write(f2, "I write myself to a file\n") #> 24
println(f2, "even with println!")
close(f2)

# 폴더에 있는 모든 파일:
for file in readdir()
	process(file)
end
