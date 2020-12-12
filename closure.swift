/* 클로져 */
/*
  코드의 블록
  일급 시민이므로 변수, 상수 등으로 저장이 가능하고 인자로 전달할 수도 있다
  함수는 이름이 있는 클로저라고 할 수 있다
*/

// MARK: - 정의
/*
  { (매개변수 목록) -> 반환타입 in
    실행 코드
  }

  매개 변수가 없으면 
  { () -> 반환타입 in
    실행 코드
  }

  반환 타입도 매개 변수도 없으면
  { () -> Void in
    실행 코드
  }
*/

// MARK: - 함수 사용
func sumFunction(a: Int, b: Int) -> Int {
  return a + b
}

var sumResult: Int = sumFunction(a: 1, b: 2)

print(sumResult) // 3

// MARK: - 클로저의 사용
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
  return a + b
}

sumResult = sum(1, 2)
print(sumResult) // 3

// 함수는 클로저의 일종이므로
// sum 변수에는 당연히 함수도 할당할 수 있다
sum = sumFunction(a:b:)

sumResult = sum(1, 2)
print(sumResult) // 3

// MARK: - 함수의 전달인자로서 클로저
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
  return a + b
}

let subtract: (Int, Int) -> Int
subtract = { (a: Int, b: Int) -> Int in
  return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in 
  return a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
  return method(a, b)
}

var calculated: Int

calculated = calculate(a: 50, b: 10, method: add)

print(calculated) // 60

calculated = calculate(a: 50, b: 10, method: subtract)

print(calculated) // 40

calculated = calculate(a: 50, b: 10, method: divide)

print(calculated) // 5

calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in
  return left * right
})

print(calculated) // 500