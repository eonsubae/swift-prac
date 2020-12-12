/* 프로퍼티 감시자 */

// 프로퍼티 값이 변경되면 원하는 동작을 수행해준다

// MARK: - 정의

struct Money {
  // 프로퍼티 감시자 사용
  var currenyRate: Double = 1100 {
    willSet(newRate) { // 바뀌기 직전에 호출
      print("환율이 \(currenyRate)에서 \(newRate)으로 변경될 예정입니다")
    }

    didSet(oldRate) { // 바뀌고 나서 호출
      print("환율이 \(oldRate)에서 \(currenyRate)으로 변경되었습니다")
    }
  }

  // 프로퍼티 감시자 사용
  var dollar: Double = 0 {
    willSet { // willSet의 암시적 매개변수의 이름은 newValue
      print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
    }

    didSet { // didSet의 암시적 매개변수의 이름은 oldValue
      print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
    }
  }

  // 연산 프로퍼티
  var won: Double {
    get {
      return dollar * currenyRate
    }
    set {
      dollar = newValue / currenyRate
    }

    /* 연산 프로퍼티에는 프로퍼티 감시자 기능을 사용할 수 없다 */
  }
}

// MARK: - 사용

var moneyInMyPocket: Money = Money()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket.currenyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다

// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다

print(moneyInMyPocket.won) // 11500.0

/*
  프로퍼티 감시자 기능은
  함수, 메서드, 클로저, 타입 등의 외부에 위치한 지역/전역 변수에도 모두 사용 가능하다
*/

var a: Int = 100 {
  willSet {
    print("\(a)에서 \(newValue)로 변경될 예정입니다")
  }
  
  didSet {
    print("\(oldValue)에서 \(a)로 변경되었습니다")
  }
}

// 100에서 200로 변경될 예정입니다
a = 200
// 100에서 200로 변경되었습니다
