/* 반복문 */

var intergers = [1, 2, 3]
let people = ["esb": 10, "eric": 15, "mike": 12]

// MARK: - for-in

/* 
  for item in items {
    code
  }
*/

for interger in intergers {
  print(interger)
}

// 딕셔너리의 아이템은 키와 밸류로 구성된 튜플 타입이된다
for (name, age) in people {
  print("\(name): \(age)")
}

// MARK: - while
/*
  while condition {
    code
  }
*/

while intergers.count > 1 { // 조건은 무조건 Bool타입이어야 한다
  intergers.removeLast()
}

// MARK: - repeat-while
// do-while과 비슷하다
/*
  repeat {
    code
  } while condition
*/

repeat {
  intergers.removeLast()
} while intergers.count > 0
