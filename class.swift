/* Class */
// 구조체는 값 타입인 반면에 클래스는 참조타입이다
// 스위프트의 클래스는 다중상속을 지원하지 않는다

// MARK: - 정의
/*
 class 이름 {
   /* 구현부 */
 }
*/

// MARK: - 프로퍼티 및 메서드

class Sample {
  var mutableProperty: Int = 100 // 가변 프로퍼티
  let immutableProperty: Int = 100 // 불변 프로퍼티

  static var typeProperty: Int = 100 // 타입 프로퍼티

  // 인스턴스 메서드
  func instanceMethod() {
    print("instance method")
  }

  // 타입 메서드
  // 재정의 불가 타입 메서드 - static
  static func typeMethod() {
    print("type method - static")
  }

  // 재정의 가능 타입 메서드 - class
  class func classMethod() {
    print("type method - class")
  }
}

// MARK: - 클래스 사용
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
// mutableReference.immutableProperty = 200 선언시 불변 프로퍼티로 선언한 것은 변경할 수 없다

let immutableReference: Sample = Sample()
immutableReference.mutableProperty = 200 // 구조체와 달리 클래스에서는 let으로 선언한 인스턴스도 가변 프로퍼티의 값을 변경할 수 있다
// immutableReference.immutableProperty = 200 선언시 불변 프로퍼티로 선언한 것은 변경할 수 없다

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

class Student {
  var name: String = "unknown"
  var `class`: String = "Swift"

  class func selfIntroduce() {
    print("학생타입입니다")
  }

  func selfIntroduce() {
    print("저는 \(self.class)반 \(name)입니다")
  }
}

Student.selfIntroduce() // 학생타입입니다

var esb: Student = Student()
esb.name = "esbae"
esb.class = "swift"
esb.selfIntroduce() // 저는 swift반 esbae입니다

let jina: Student = Student()
jina.name = "jina" // let으로 선언한 인스턴스임에도 구조체와 달리 가변 프로퍼티를 변경할 수 있다
jina.selfIntroduce() // 저는 swift반 jina입니다