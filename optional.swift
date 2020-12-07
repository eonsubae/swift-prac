// Optional은 값이 있을 수도, 없을 수도 없는 상태를 나타낸다
// nil의 가능성을 문서화하지 않고도 코드로서 명시적으로 표현할 때 필요하다
// 따라서 문서 작성 시간이 줄어든다
// 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용할 수 있으므로
// 더 효율적이고 예외 상황을 최소화하는 안전한 코딩이 가능하다

// optionParam can be nil
// 위와 같은 주석이 없이도 옵셔널(?)의 유무로 표현이 가능하다 
func someFunc(optionParam: Int?) {
  // ...
}

// param must not be nil 
// 위와 같은 주석이 없이도 옵셔널(?)의 유무로 표현이 가능하다 
func someFunc(param: Int) {
  // ...
}

someFunc(optionParam: nil) // OK
someFunc(param: nil) // 컴파일 에러 발생

// 옵셔널은 사실 열거형(enum)과 제네럴(general)의 합성이다
enum Optional<Wrapped> : ExpressibleByNilLiteral {
  case none
  case some(Wrapped)
}

// 아래처럼 두 가지 방식으로 사용할 수 있다
let optionalValue: Optional<Int> = nil
let optionalValue: Int? = nil

// MARK: - Implicitly Unwrapped Optional(암시적 추출 옵셔널)

var optionalValue: Int! = 100

switch optionalValue {
case .none:
  print("This Optional variable is nil")
case .some(let value):
  print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
optionalValue = optionalValue + 1

// nil 할당 가능
optionalValue = nil

// 잘못된 접근으로 인한 런타임에러가 발생가능
optionalValue = optionalValue + 1 // 위에서 nil값을 넣어줬는데 변경을 시도하므로 에러가 발생

// ?를 사용한 옵셔널

var optionalValue: Int? = 100 // Int타입의 값이 들어있을 수도 없을 수도 있음을 나타냄

switch optionalValue {
case .none:
  print("This Optional variable is nil")
case .some(let value):
  print("Value is \(value)")
}

// 기존 변수처럼 사용 불가
optionalValue = optionalValue + 1 // 옵셔널은 일반적인 타입과는 다른 타입이므로 연산이 불가하다

// nil 할당 가능
optionalValue = nil