# 표준 라이브러리 함수 호출:
lang = ccall( (:getenv, "libc"),Ptr{Uint8}, (Ptr{Uint8},), "LANGUAGE")
# 리룩스에서 잘 작동한다.
# 윈도우에서 다음 오류를 반환한다: ERROR: error compiling anonymous: could not load module libc:
# 구체적인 모듈을 찾을 수 없다
bytestring(lang) #> "en_US"

# 라이브러리 존재 여부 확인
find_library(["libc"]) #> "libc"

