// 상수 let, 변수 var

// 상수의 선언
// let 이름: 타입 = 값

// 변수의 선언
// var 이름: 타입 = 값

// 값의 타입이 명확하다면 타입은 생략 가능
// let 이름 = 값
// var 이름 = 값
let constant: String = "차후에 변경 불가능"
var variable: String = "차후에 변경 가능"

variable = "변수 변경"

// 값의 할당을 나중에 하려는 경우는 상수든 변수든 타입을 반드시 작성해야 한다
let sum: Int
let inputA: Int = 200
let inputB: Int = 200

// 상수는 아래와 같이 한번만 할당 가능
sum = inputA + inputB

// 변수는 계속 다른 값을 할당 가능
var nickName: String

nickName = "esb"
nickName = "esbae"