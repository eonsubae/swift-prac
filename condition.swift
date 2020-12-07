// MARK: - if-else

/* 
  if condition {
    statements
  } else if condition {
    statements
  } else {
    statements
  }
*/

// 소괄호는 생략가능하지만 중괄호는 생략할 수 없다
if (someInteger < 100) { // OK
  // statements
}

if someInteger < 100 { // OK
  // statements
}

if someInteger < 100 // statements 에러 발생(중괄호 생략 불가)

// swift의 조건문에는 항상 Bool타입의 값이 들어와야 한다
// truthy, falsy한 값같은 다른 타입의 값으로 유추하는 판단은 불가능하다
// if someInteger {} 에러 발생(Int는 Bool타입이 아니기 때문)

// MARK: - switch
/*
  switch value {
  case pattern:
    code
  default:
    code
  }
*/

// 범위 연산자를 활용하면 더 수월하게 스위치문을 사용할 수 있다
switch someInteger {
case 0:
  print("zero")
case 1..<100:
  print("1~99")
case 100:
  print("100")
case 101...Int.max:
  print("over 100")
default:
  print("unknown")  
} 

// 케이스에 대부분의 기본 타입들을 다 사용할 수 있다
// 정확히는 Hashable 프로토콜을 따르는 타입의 값이라면 다 사용할 수 있다
// 스위프트의 스위치문은 명확히 케이스가 전부 명시되지 않는 한 default구문을 생략할 수 없다
switch "esb" {
case "jake":
  print("jake")
case "mina":
  print("mina")
case "esb":
  print("esb")
default: 
  print("unknown")
}

// 명시적으로 break를 지정하지 않아도 아래의 케이스문이 실행되거나 하지 않는다
// 만약 복수의 케이스를 지정하고 싶다면 아래처럼 콤마로 연결할 수 있다
switch "esb" {
case "jake", "mina":
  print("jake and mina")
default:
 print("unknown")
}

// 만약 특정 케이스에 매칭이 되어도 아래의 케이스까지 실행되도록 하고 싶다면 fallthrough를 사용하면 된다
switch "esb" {
case "jake":
  print("jake")
  fallthrough
case "mina":
  print("mina")
case "esb":
  print("esb")
default: 
  print("unknown")
}