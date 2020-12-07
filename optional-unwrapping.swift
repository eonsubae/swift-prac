// 옵셔널을 꺼내서 사용하는 방법

// 1. Optional Binding 옵셔널 바인딩
// nil 체크 + 안전한 값 추출

func printName(_ name: String) {
  print(name)
}

var myName: String? = nil

printName(myName) // 전달되는 값의 타입이 다르므로 컴파일 오류가 발생한다

// if-let을 사용하면 옵셔널 바인딩을 할 수 있다
var myName: String! = nil
if let name: String = myName {
  printName(name)
} else {
  print("myName == nil")
}

// 위의 if let구문에서 선언된 name이라는 상수는 if let의 스코프 안에서만 사용이 가능하다
// 아래 호출은 스코프를 벗어났기 때문에 에러가 발생한다
printName(name) 

// 한번에 여러 개의 옵셔널 바인딩도 가능하다
var myName: String? = "esbae"
var yourName: String? = nil

if let name = myName, let friend = yourName {
  print("\(name) and \(friend)")
} // yourName이 nil이기 때문에 실행되지 않는다


yourName = "hana"

if let name = myName, let friend = yourName {
  print("\(name) and \(friend)")
} // esbae and hana가 출력된다

// 2. Force Unwrapping 강제 추출
// 값을 강제로 추출해서 가져오는 방법

var myName: String? = "esb"
printName(myName!) // esb

myName = nil
printName(myName!) // 강제추출시 값이 없으므로 에러가 발생