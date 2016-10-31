email_pattern = r".+@.+"
input = "john.doe@mit.edu"
println(ismatch(email_pattern, input)) #> true

visa = r"^(?:4[0-9]{12}(?:[0-9]{3})?)$"
input = "4457418557635128"

ismatch(visa, input)  #> true
if ismatch(visa, input)
    println("credit card found")
    m = match(visa, input)
    println(m.match) #> 4457418557635128
    # println(m.captures) #> nothing
    println(m.offset) #> 1
    println(m.offsets) #> []
end

email_pattern = r"(.+)@(.+)"
input = "john.doe@mit.edu"
m = match(email_pattern, input)
println(m.captures) #> ["john.doe","mit.edu"]

m = match(r"(ju|l)(i)?(a)", "Julia")
println(m.match) #> "lia"
println(m.captures) #> l - i - a
println(m.offset) #> 3
println(m.offsets) #> 3 - 4 - 5

str = "The sky is blue"
reg = r"[\w]{3,}"
# matchall 함수는 모든 일치에 대한 RegexMatch로 구성된 배열을 반환한다
r = matchall(reg, str)
show(r) #> ["The","sky","blue"]
# eachmatch는 모든 일치에 대한 반복자(iterator) iter를 반환한다
iter = eachmatch(reg, str)
for i in iter
    println("\"$(i.match)\" ")
end
