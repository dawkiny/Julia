# 신문 헤더라인
str = "The Gold and Blue Loses a Bit of Its Luster"
println(str)
nchars = length(str)
println("The headline counts $nchars characters") # 43
str2 = replace(str, "Blue", "Red")
# 문자열은 변경불가능(immutable)이다
println(str) # The Gold and Blue Loses a Bit of Its Luster
println(str2)
println("Here are the characters at position 25 to 30:")
subs = str[25:30]
print("-$(lowercase(subs))-") # "-a bit -"
println("Here are all the characters:")
for c in str
    println(c)
end
arr = split(str,' ')
show(arr) # ["The","Gold","and","Blue","Loses","a","Bit","of","Its","Luster"]
nwords = length(arr)
println("The headline counts $nwords words") # 10
println("Here are all the words:")
for word in arr
    println(word)
end
arr[4] = "Red"
show(arr) # arrays는 변경가능(mutable)이다
println("Convert back to a sentence:")
nstr = join(arr, ' ')
println(nstr) # The Gold and Red Loses a Bit of Its Luster
# 배열로 작업하기:
println("arrays: calculates the sum, mean and standard deviation ")
arr = [1:100]
typeof(arr) #>
println(sum(arr)) #> 5050
println(mean(arr)) #> 50.5
println(std(arr)) #> 29.011491975882016
