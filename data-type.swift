// Swift의 기본 데이터 타입
/* 
  Bool, Int, UInt, Float, Double, Character, String
*/

// Bool
var someBool: Bool = true;
someBool = false;
// 스위프트는 0과 1로 true or false를 나타낼 수 없다(Bool타입에는 Int타입을 사용할 수 없다는 에러가 발생한다)

// Int
var someInt: Int = -100

// UInt
// UInt타입에는 양수값을 가진 Int변수를 할당하면 에러가 발생한다. 스위프트는 자료형에 엄격한 언어이므로 주의하자
var someUInt: UInt = 100

// Float
var someFloat: Float = 3.14
// Float에는 정수타입을 넣어도 된다
someFloat = 3

// Double
var someDouble: Double = 3.14
// Double에도 정수타입을 넣어도 된다
// 그러나 Int와 UInt의 관계처럼 Double타입의 변수에는 Float타입의 변수의 값을 할당할 수 없다
someDouble = 3

// Character
var someCharacter: Character = "한" // 길이가 1인 문자열만 저장할 수 있다

// String
// String타입의 변수에 Character타입의 변수의 값을 할당할 수 없다
var someString: String = "하하하"
