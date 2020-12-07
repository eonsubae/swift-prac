// MARK: 함수의 선언

/*
  func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입, ...) -> 반환타입 {
    함수 구현부
    return 반환값
  }
*/

func sum(a: Int, b: Int) -> Int { 
  return a + b
}

// 반환값이 없다면 Void를 사용하면 된다
func printMyName(name: String) -> Void {
  print(name)
}

// 반환값이 없는 경우 생략도 가능
func printMyName2(name: String) {
  print(name)
}

// 매개변수가 없으면 괄호를 비워주면 된다
func maximumIntergerValue() -> Int {
  return Int.max
}

// 매개변수도 반환값도 없는 경우 괄호를 비운 뒤 Void를 사용하거나 Void도 생략할 수 있다
func hello() -> Void { print("hello") }
func bye() { print("bye") }

// 함수의 호출
sum(3, 5)
printMyName("esb")
printMyName2("esbae")
maximumIntergerValue()
hello()
bye()