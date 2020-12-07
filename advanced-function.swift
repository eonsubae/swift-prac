// MARK: - 매개 변수 기본값

// 기본값을 가지는 매개변수는 매개변수 목록의 뒤쪽에 위치시키는 것이 좋다
/*
  func 함수이름 (매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수2 기본값,   ...) -> 반환타입 {
    함수 구현부
    return 반환값
  }
*/

func greeting(friend: String, me: String = "esb") {
  print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가진 인자는 생략할 수 있다
greeting(friend: "hana") // "Hello hana! I'm esb"
greeting(friend: "john", me: "eric") // "Hello john! I'm eric"

// MARK: - 전달인자 레이블
// 함수 사용자 입장에서 매개변수의 역할을 좀 더 명확하게할 때 사용한다
/*
  func 함수이름 (전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입 = 매개변수2 기본값,  ...) -> 반환타입 {
    함수 구현부
    return 반환값
  }
*/

func greeting(to friend: String, from me: String = "esb") { // to와 from이라는 레이블로 의미를 좀 더 명확하게 전달
  print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출시에는 전달인자 레이블을 사용해야 한다
greeting(to: "hana", from: "esbae")

// MARK: - 가변 매개변수
// 매개변수로 전달받을 값의 갯수가 정확하지 않을 때 사용한다
/* 함수당 하나의 가변 매개변수를 가질 수 있고, 타입뒤에 점3개를 붙여서 가변 매개변수로 만들 수 있다. 매개변수 목록의 가장 마지막에 사용하는 것이 좋다
  func 함수이름 (매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
    함수 구현부
    return 반환값
  }
*/

func sayHelloToFriends(me: String, friends: String...) -> String {
  return "Hello \(friends)! I'm \(me)"
}

print(sayHelloToFriends(me: "esbae", friends: "hana", "eric", "wing"))
print(sayHelloToFriends(me: "esbae") // 가변인자에 아무것도 지정하고 싶지 않다면 생략할 수 있다

// MARK: - 데이터 타입으로서 함수
// 스위프트의 함수는 1급객체이기 때문에 변수처럼 사용할 수 있다
// (매개변수1타입, 매개변수2타입, ...) -> 반환타입(생략 가능)

var someFunction = (String, String) -> Void = greeting(to:from:)
someFunction("eric", "esb")

someFunction = greeting(friend:me:)
someFunction("eric", "esb")

// 타입이 다른 함수는 할당할 수 없다
someFunction = sayHelloToFriends(me: friends:)

func runAnother(function: (String, String) -> Void) {
  function("jenny", "mike")
}

// Hello jenny! I'm mike
runAnother(function: greeting(friend:me:))

// Hello jenny! I'm mike
runAnother(function: someFunction)