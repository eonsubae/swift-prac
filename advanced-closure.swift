/* 클로저 고급 */

/*
  후행 클로저
  반환타입 생략
  단축 인자이름
  암시적 반환 표현
*/

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
  return method(a, b)
}

var result: Int

// MARK: - 후행 클로저
/*
  클로저가 함수의 마지막 전달인자라면
  마지막 매개변수 이름을 생략하고 함수 소괄호 외부에 클로저를 구현할 수 있다
*/

result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
  return left + right
}

print(result) // 20

// MARK: - 반환타입 생략
/*
  calculate 함수의 method 매개변수는 Int타입을 반환할 것임을 컴파일러도 알고 있으므로
  굳이 클로저에서 반환타입을 명시해 주지 않아도 된다. 그러나 in 키워드는 생략이 불가능하다
*/

result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in 
  return left + right
})

// 후행 클로저와 함께 반환타입 생략하기

result = calculate(a: 10, b: 10) { (left: Int, right: Int) in 
  return left + right
}

// MARK: - 단축 인자이름
/*
  클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있다
  단축 인자이름은 클로저의 매개변수의 순서대로 $0, $1, ...처럼 표현된다
*/

result = calculate(a: 10, b: 10, method: { 
  return $0 + $1
})

print(result) // 20

// 후행 클로저와 함께 사용하기
result = calculate(a: 10, b: 10) {
  return $0 + $1
}

print(result) // 20

// MARK: - 암시적 반환 표현
/*
  클로저의 반환 값이 있다면 클로저의 마지막 줄의 결과값은 return 키워드가 없어도 암시적으로 반환값으로 취급한다
*/

result = calculate(a: 10, b: 20) { $0 + $1 }

print(result) // 20

// 축약전과 축약후 비교

// 축약전
result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) -> Int in 
  return left + right
})

// 축약후
result = calculate(a: 10, b: 10) { $0 + $1 }

print(result) // 20