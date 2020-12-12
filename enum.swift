/*
  열거형

  enum은 타입이므로 파스칼케이스로 이름을 정의한다
  각 케이스는 카멜케이스로 정의한다
  각 케이스는 그 자체가 고유의 값이다

  enum 이름 {
    case 이름1
    case 이름2
    case 이름3, 이름4, 이름5
    ...
  }
*/

// MARK: - 열거형 사용

enum Weekday {
  case mon
  case tue
  case wed
  case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue

print(day)

// 열거형은 스위치문에서도 많이 사용된다
switch day {
case .mon, .tue, .wed, .thu:
  print("평일")
case Weekday.fri:
  print("불금")
case .sat, .sun:
  print("주말")  
}

// MARK: - 원시값

/*
  C언어의 enum처럼 정수값을 가질 수 있다
  rawValue를 사용하면 된다
  case별로 각각 다른 값을 가져야 한다
*/

enum Fruit: Int {
  case apple = 0
  case grape = 1
  case peach // 값이 지정되어 있지 않으면 자동으로 1씩 증가하므로 2가 들어간다
  // case mango = 0 apple과 값이 같으므로 에러 발생
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2

// 정수 타입 뿐만 아니라 Hasable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있다

enum School: String {
  case elementary = "초등"
  case middle = "중등"
  case high = "고등"
  case university // 숫자와 달리 문자열은 자동으로 변화될 값을 알 수 없으므로 case의 이름이 그대로 반환된다
}

print("School.middle.rawValue == \(School.middle.rawValue)")
// School.middle.rawValue == 중등

print("School.university.rawValue == \(School.university.rawValue)")
// School.middle.rawValue == university

// MARK: - 원시값을 통한 초기화

/*
  rawValue를 통해 초기화가 가능하다
  rawValue가 case에 해당되지 않을 수 있으므로 rawValue로 초기화 한 인스턴스는 옵셔널 타입이다
*/

// let apple: Fruit = Fruit(rawValue: 0) 케이스가 없으면 생성이 되지 않을 수도 있기 때문에 오류가 발생한다
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
  print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
  print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다

// MARK: - 메서드

enum Month {
  case dec, jan, feb
  case mar, apr, may
  case jun, jul, aug
  case sep, oct, nov

  func printMessage() {
    switch self {
    case .mar, .apr, .may:
      print("봄")
    case .jun, .jul, .aug:
      print("여름")
    case .sep, .oct, .nov:
      print("가을")
    case .dec, .jan, .feb:
      print("겨울")
    }
  }
}

Month.mar.printMessage()