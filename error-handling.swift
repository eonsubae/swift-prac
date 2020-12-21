/* 오류처리 */

// MARK: - 오류표현
// Error 프로토콜과 (주로)열거형을 사용해 오류를 표현한다

/*
  enum 오류종류이름: Error {
    case 종류1:
    case 종류2:
    case 종류3:
    // ...
  }
*/

// 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형
enum VendingMachineError: Error {
  case invalidInput
  case insufficientFunds(moneyNeeded: Int)
  case outOfStock
}

// MARK: - 함수에서 발생한 오류 던지기
/*
  자판기 동작 도중 발생한 오류 던지기
  오류 발생의 여지가 있는 메서드는 throws를 사용하여
  오류를 내포하는 함수임을 표시한다
*/

class VendingMachine {
  let itemPrice: Int = 100
  var itemCount: Int = 5
  var deposited: Int = 0

  // 돈 받기 메서드
  func receiveMoney(_ money: Int) throws {

    // 입력한 돈이 0이하면 오류를 던진다
    guard money > 0 else {
      throw VendingMachineError.invalidInput
    }

    // 오류가 없으면 정상처리를 한다
    self.deposited += money
    print("\(money)원 받음")
  }

  // 물건 팔기 메서드
  func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {

    // 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던진다
    guard numberOfItemsToVend > 0 else {
      throw VendingMachineError.invalidInput
    }

    // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던진다
    guard numberOfItemsToVend * itemPrice <= deposited else {
      let moneyNeeded: Int
      moneyNeeded = numberOfItemsToVend * itemPrice - deposited

      throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
    }

    // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 발생시킨다
    guard itemCount >= numberOfItemsToVend else {
      throw VendingMachineError.outOfStock
    }

    // 오류가 없으면 정상처리를 한다
    let totalPrice = numberOfItemsToVend * itemPrice

    self.deposited -= totalPrice
    self.itemCount -= numberOfItemsToVend

    return "\(numberOfItemsToVend)개 제공함"
  }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?

// MARK: - 오류처리
/*
  오류발생의 여지가 있는 throws 함수(메서드)는
  try를 사용하여 호출해야 한다
  try, try?, try!
*/

// MARK: - do-catch
/*
  오류발생의 여지가 있는 throws 함수(메서드)는
  do-catch 구문을 활용하여
  오류발생에 대비한다
*/

do {
  try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
  print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
  print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
  print("수량이 부족합니다")
} // 입력이 잘못되었습니다

// catch를 여러번 쓰는 것이 번거롭다면
do {
  try machine.receiveMoney(300)
} catch /* (let error) 캐치문 옆에 인자인 error를 적어주지 않아도 암시적으로 넘어온다. 이름의 변경도 가능하다 */ {

  switch error {
  case VendingMachineError.invalidInput:
    print("입력이 잘못되었습니다")
  case VendingMachineError.insufficientFunds(let moneyNeeded):
    print("\(moneyNeeded)원이 부족합니다")
  case VendingMachineError.outOfStock:
    print("수량이 부족합니다")
  default:
    print("알수없는 오류 \(error)")
  }
}  // 300원 받음

// 오류를 세분화하지 않아도 될 때
do {
  result = try machine.vend(numberOfItems: 4)
} catch {
  print(error)
} // insufficientFunds(100)

// 오류를 처리하지 않아도 될 때
do {
  result = try machine.vend(numberOfItems: 4)
} // 그러나 오류를 처리하지 않아도 되는 경우는 많지 않다

// 오류처리를 하면서도 간결함을 원하면 try? 혹은 try!를 사용하자
// MARK: - try?와 try!
/*
  try? : 별도의 오류처리 결과를 통보받지 않고
  오류가 발생했으면 결과값을 nil로 돌려받을 수 있다
  정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려 받는다
*/

result = try? machine.vend(numberOfItems: 2)
result // Optional("2개 제공함")

result = try? machine.vend(numberOfItems: 2)
result // nil

/*
  try! : 오류가 발생하지 않을 것이라는 강력한 확신을 가질 때
  try!를 사용하면 정상동작 후에 바로 결과값을 돌려받는다
  오류가 발생하면 런타임 오류가 발생하여 애플리케이션 동작이 중지된다
*/

result = try! machine.vend(numberOfItems: 1)
result // 1개 제공함