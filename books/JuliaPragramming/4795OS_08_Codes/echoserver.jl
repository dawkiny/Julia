# 줄리아 서버 포트 8080에 연결하려면 프롬프트에서 netcat(nc)를 시작한다.
# nc localhost 8080
server = listen(8080)
while true
  conn = accept(server)
  @async begin
    try
      while true
        line = readline(conn)
        println(line)
        write(conn,line)
      end
    catch ex
      print("connection ended with error $ex")
    end
  end # end coroutine block
end
