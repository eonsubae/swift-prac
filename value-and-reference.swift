/* 값 타입과 참조 타입 */

/*
  Class 클래스

  1. 전통적인 OOP 관점에서의 클래스
  2. 단일 상속
  3. 인스턴스/타입 메서드
  4. 인스턴스/타입 프로퍼티
  *5. 참조 타입
  6. Apple 프레임워크의 대부분의 큰 뼈대는 모두 클래스로 구성
*/

/*
  Struct 구조체

  1. C 언어 등의 구조체보다 다양한 기능
  2. 상속 불가
  3. 인스턴스/타입 메서드
  4. 인스턴스/타입 프로퍼티
  *5. 값 타입
  6. Swift의 대부분의 큰 뼈대는 모두 구조체로 구성
*/

/*
  Enum 열거형

  1. 다른 언어의 열거형과는 많이 다르다(기능이 다양)
  2. 상속 불가
  3. 인스턴스/타입 메서드
  4. 인스턴스/타입 프로퍼티
  *5. 값 타입
  6. 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정리
  7. 열거형 자체가 하나의 데이터 타입이고, 열거형의 case 하나하나가 전부 유의미한 값으로 취급된다
  8. 선언 키워드 - enum
*/

/* Class Struct Enum 비교 */
//                Class    Struct    Enum
// Type         Reference  Value     Value
// Subclassing      O        X         X
// Extension        O        O         O

/* 구조체의 사용처 */
/*
  1. 연관된 값들을 모아서 하나의 데이터 타입으로 표현하고 싶을 때
  2. 다른 객체 또는 함수로 전달할 때 참조가 아닌 복사를 원할 때
  3. 자신을 상속할 필요가 없거나, 자신이 다른 타입을 상속받을 필요가 없을 때
  4. Apple 프레임워크에서 프로그래밍을 할 때는 주로 클래스를 많이 사용한다
*/

/* Value vs Reference */
/*
  1. Value : 데이터를 전달할 때 값을 복사하여 전달
  2. Reference: 데이터를 전달할 때 값의 메모리 위치를 전달
*/

/* 클래스, 구조체/열거형 비교 */

// MARK: - Class vs Struct/Enum

struct ValueType {
  var property = 1  
}

class ReferenceType {
  var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct instance property: \(firstStructInstance.property)") // 1
print("second struct instance property: \(secondStructInstance.property)") // 2

let firstClassInstance = ReferenceType()
var secondClassInstance = firstClassInstance
secondClassInstance.property = 2

print("first class instance property: \(firstClassInstance.property)") // 2
print("second class instance property: \(secondClassInstance.property)") // 2

/* test */
struct SomeStruct {
  var someProperty: String = "Property"
}

var someStructInstance: SomeStruct = SomeStruct()

func someFunction(structInstance: SomeStruct) {
  var localVar: SomeStruct = structInstance
  localVar.someProperty = "ABC"
}

someFunction(someStructInstance)
print(someStructInstance.someProperty) // Property가 출력된다. 참조가 아니므로 someFunction이 실행된 후에도 기존 값은 유지되기 때문이다

class SomeClass {
  var someProperty: String = "Property"
}

var someClassInstance: SomeClass = SomeClass()

func someFunction(classInstance: SomeClass) {
  var localVar: SomeClass = classInstance
  localVar.someProperty = "ABC"
}

someFunction(someClassInstance)
print(someClassInstance.someProperty) // ABC가 출력된다. 참조이므로 someFunction이 실행된 후에 값이 변경되기 때문이다

/* 스위프트의 데이터 타입 구조 */
/*
public struct Int
public struct Double
public struct String
public struct Dictionary<Key : Hashable, Value>
public struct Array<Element>
public struct Set<Element : Hashable>
*/

/*
  스위프트는 클래스보다 구조체, 열거형 사용을 선호한다
  하지만 Apple 프레임워크는 대부분 클래스를 사용하고 있다
  Apple 프레임워크 사용시 구조체/클래스 선택은 개발자의 몫이다
*/