/*
  Any - Swift의 모든 타입을 지칭하는 키워드
  AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
  nil - 없음을 나타내는 키워드
*/

// MARK: any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능"
someAny = 123.12

// 특정 타입의 값에 Any타입의 값을 할당할 수 없다
// let someDouble: Double = someAny 에러 발생

// MARK: AnyObject
class SomeClass {}

var someAnyObject: AnyObject = SomeClass()

// 클래스 타입인 다른 타입의 값을 할당하면 에러가 발생한다
// someAnyObject = 123.12 에러 발생

// MARK: nil
// 없음을 의미하는 nil을 변수에 할당할 수 없다
// someAny = nil 에러 발생
// someObject = nil 에러 발생