# !!! 이 스크립트는 줄리아 버전 0.4 이상에서 작동한다. !!!
# 시작 시간:
start_time = time()
# 경과 시간 계산
time_elapsed = time() - start_time
println("Time elapsed: $time_elapsed") #> 0.0010001659393310547

d = Date(2014,9,1) #> 2014-09-01
dt = DateTime(2014,9,1,12,30,59,1) #> 2014-09-01T12:30:59.001
# accessors:
Dates.year(d)
Dates.month(d)
Dates.week(d)
Dates.day(d)
# functions:
Dates.isleapyear(d)
Dates.dayofyear(d)
Dates.monthname(d)
Dates.daysinmonth(d)
