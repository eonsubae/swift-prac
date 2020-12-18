/* 타입캐스팅 */

/*
  스위프트의 타입캐스팅은 인스턴스의 타입을 확인하는 용도
  또는 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도로 사용한다
  타입캐스팅에는 is, as 키워드를 사용한다
*/

/*
  기존의(다른 프로그래밍 언어의) 타입캐스팅은 아래와 같은 것들을 상상할 것이다
  let someInt: Int = 100
  let someDouble: Double = Double(someInt)
  그러나 스위프트에서는 이를 타입캐스팅이라 하지 않는다
  위의 코드는 단지 Double타입의 값을 하나 더 생성한 것일 뿐이다
*/

// 타입 캐스팅을 위한 클래스 정의
class Person {
  var name: String = ""
  func breath() {
    print("숨을 쉰다")
  }
}

class Student: Person {
  var school: String = ""
  func goToSchool() {
    print("등교를 한다")
  }
}

class UniversityStudent: Student {
  var major: String = ""
  func goToMT() {
    print("멤버쉽 트레이닝에 간다")
  }
}

var esbae: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

// MARK: - 타입 확인
// is를 사용하여 타입을 확인한다

var result: Bool

result = esbae is Person // true
result = esbae is Student // false
result = esbae is UniversityStudent // false

result = hana is Person // true
result = hana is Student // true
result = hana is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

if esbae is UniversityStudent {
  print("esbae는 대학생입니다")
}
else if esbae is Student {
  print("esbae는 학생입니다")
}
else if esbae is Person {
  print("esbae는 사람입니다") // esbae는 사람입니다
}

switch jason {
case is Person:
  print("jason은 사람입니다") // jason은 사람입니다
case is Student:
  print("jason은 학생입니다")
case is UniversityStudent:
  print("jason은 대학생입니다")
default:
  print("jason은 사람도, 학생도, 대학생도 아닙니다")
}

switch jason {
case is UniversityStudent:
  print("jason은 대학생입니다") // jason은 대학생입니다
case is Person:
  print("jason은 사람입니다")
case is Student:
  print("jason은 학생입니다")
default:
  print("jason은 사람도, 학생도, 대학생도 아닙니다")
}

// MARK: - 업 캐스팅
/*
  as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 전환해준다
  Any 혹은 AnyObject로도 타입정보를 변환할 수 있다
  암시적으로 처리되므로 생략해도 무방해서 많이 사용되지 않는다
*/

var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
// var jina: UniversityStudent = Person() as UniversityStudent 부모를 자식으로 전환할 수 없으므로 컴파일 오류
var jina: Any = Person() as Any // Any는 어떤 타입도 OK. as Any 생략가능

// MARK: - 다운 캐스팅
/*
  as? 또는 as!를 사용하여 자식 클래스의 인스턴스로 사용할 수 있도록
  컴파일러에게 인스턴스의 타입 정보를 전환해준다
*/

// MARK: - 조건부 다운 캐스팅
// as?

var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

// MARK: - 강제 다운 캐스팅
// as!

var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
// forcedCasted = jenny as! UniversityStudent 런타임 오류
// forcedCasted = jina as! UniversityStudent 런타임 오류
// forcedCasted = jina as! Student 런타임 오류

// 활용
func doSomethingWithSwitch(someone: Person) {
  switch someone {
  case is UniversityStudent:
    (someone as! UniversityStudent).goToMT()
  case is Student:
    (someone as! Student).goToSchool()
  case is Person:
    (someone as! Person).breath()
  }
}

// 활용2
func doSomething(someone: Person) {
  if let universityStudent = someone as? UniversityStudent {
    universityStudent.goToMT()
  }
  else if let student = someone as? Student {
    student.goToSchool()
  }
  else if let person = someone as? Person {
    person.breath()
  }
}