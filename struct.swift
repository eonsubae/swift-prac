// 스위프트에서는 대부분의 타입이 구조체로 이루어져 있을 정도로 중요한 역할을 맡고 있다
/*
  struct 이름 {
    /* 구현부 */
  }
*/

// MARK: - 프로퍼티 및 메서드
struct Sample {
  var mutableProperty: Int = 100 // 가변 프로퍼티
  let immutableProperty: Int = 100 // 불변 프로퍼티

  static var typeProperty: Int = 100 // 타입 프로퍼티

  // 인스턴스 메서드
  func instanceMethod() {
    print("instance method")
  }

  // 타입 메서드
  static func typeMethod() {
    print("type method")
  }
}

// MARK: - 구조체 사용

// 가변 인스턴스
var mutable: Sample = Sample()

mutable.mutableProperty = 200
// mutable.immutableProperty = 200 immutableProperty은 프로퍼티 선언 자체에서 이뮤터블이었으므로 변경이 불가하므로 에러가 발생

// 불변 인스턴스
let immutable: Sample = Sample()

// immutable.mutableProperty = 200 아무리 내부의 값을 가변 프로퍼티로 선언했다 하더라도 변경해줄 수 없어서 에러가 발생한다
// mutable.immutableProperty = 200 에러 발생

// 타입 프로퍼티 및 메서드
// 구조체 자체가 사용할 수 있는 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()

// mutable.typeProperty = 400 인스턴스에서는 타입 프로퍼티를 사용할 수 없으므로 에러가 발생한다
// mutable.typeMethod() 인스턴스에서는 타입 프로퍼티를 사용할 수 없으므로 에러가 발생한다

// MARK: - 예제(학생 구조체)
struct Student {
  var name: String = "unknown"
  var `class`: String = "Swift"

  static func selfIntroduce() {
    print("학생 타입입니다")
  }

  func selfIntroduce() {
    print("저는 \(self.class)반, \(name)입니다") // 
  }
}

Student.selfIntroduce() // 학생 타입입니다

var esbae: Student = Student()
esbae.name = "esbae"
esbae.class = "스위프트"
esbae.selfIntroduce() // 저는 스위프트반 esbae입니다

let jina: Student = Student()

// 불변 인스턴스의 프로퍼티 값은 변경이 불가능하므로 에러가 발생한다
// jina.name "jina"
jina.selfIntroduce() // 저는 Swift반 unknown입니다